import { Komponent , render, fu} from 'kofujs'
import {url} from './url.js'
// assign colors and style objects
import {mainColor, styles} from './style.js'
// Create Komponent Logic
class BidOpsExample extends Komponent{
  constructor (props)  {
    super (props)
    this.classes = this.setStyles(styles).classes;
    this.data = {
      items:[],
      categories: [],
      attributes: [],
      properties: [],
      newItemName:'',
      newCategoryName:'',
      numericPropertyNames: [],
      stringPropertyNames: []
    };
    this.state = {
      showFilter: false,
      currentFilter: '',
      filteredItems: [],
      updateItemName: '',
      updateCategoryName: ''
    }
    this.getItems = this.getItems.bind(this);
    this.handleCreateItem = this.handleCreateItem.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleUpdateItem = this.handleUpdateItem.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.createCategory = this.createCategory.bind(this);
  }
  async komponentDidMount () {
    await this.getItems()
  }
  async handleChange (event){
    await this.updateData({[event.target.id]: event.target.value})
      console.log(this.data[event.target.id])
  }
  async handleUpdateChange (event){
    await this.setState({[event.target.id]: event.target.value})
      console.log(this.state[event.target.id])
  }
  showErrorModal(){
    this.setState({showErrorModal: true})
  }
  //Create
  async handleCreateItem (event){
    event.preventDefault();
    if(!this.data.newItemName){
      return this.showErrorModal()
    }
    try{
     const response = await fetch(`${url}/items`,
         {
           method: 'POST',
           body: JSON.stringify({
            item: {name: this.data.newItemName}
           }),
            headers: {
                 'Accept': 'application/json, text/plain, */*',
                 'Content-Type': 'application/json'
             }
         })
        const createdItem = await response.json()
        await this.updateData({
            newItemName: '',
            items: [createdItem, ...this.data.items]
        })
        console.log(this.data.newItemName)
    }catch(e){
        console.error(e)
    }
  }
  async createCategory (event){
    event.preventDefault();
    if(!this.data.newCategoryName){
      return this.showErrorModal()
    }
    try{
     const response = await fetch(`${url}/categories`,
         {
           method: 'POST',
           body: JSON.stringify({
            category: {name: this.data.newCategoryName}
           }),
            headers: {
                 'Accept': 'application/json, text/plain, */*',
                 'Content-Type': 'application/json'
             }
         })
        const createdCategory = await response.json()
        await this.updateData({
            newCategoryName: '',
            categories: [ ...this.data.categories, {id: createdCategory.id, name: createdCategory.name}]
        })
        console.log(this.data.newItemName)
    }catch(e){
        console.error(e)
    }
  }
  // Read
  async getItems(){
    try{
      const response = await fetch('http://localhost:3006/items/show/allData');
      const data = await response.json();
      const {items, categories, properties, attributes} = data;
      await this.updateData({items, categories, properties, attributes});
      console.log(this.data)
    }catch(error){
      console.error(error);
    }
  }
  // Update
  async handleUpdateItem (event){
    /*As a user, I should be able to create items with the same properties as other items without having to recreate all of the properties.*/

  }
  async handleDeleteItem (event, id){
    try {
      const data = await fetch(`${url}/items/${id}`,{
                 method: 'DELETE',
                  headers: {
                       'Accept': 'application/json, text/plain, */*',
                       'Content-Type': 'application/json'
                   }
               })
        const removed = await data.json()
        const itemsCopy = [...this.data.items]
        const removedItemIdx = itemsCopy.indexOf(removed)
        itemsCopy.splice(removedItemIdx, 1)
        await this.updateData({items: itemsCopy})
    } catch (e) {
      console.error(e)
    }

  }
  async handleClick(event, button){
    if(this.state.currentFilter === button.name){
      this.setState({showFilter: false, currentFilter: ''})
    }else {
      this.setState({showFilter: true, currentFilter: button.name})
    }
    try {
      if(this.state.showFilter){
      const response = await fetch(`${url}/categories/${button.id}`)
      const data = await response.json()
      this.updateData({items: data.items})
    } else if (this.state.currentFilter === '') {
      await this.getItems()
    }
    } catch (e) {
      console.error(e)
    }
  }

  present () {
    return (
        <div
          className={this.classes.pageContainer}
        >
        <div
        className={this.classes.formContainer}
        >
        <form
          className={this.classes.form}
          onSubmit={this.handleCreateItem}
          >
            <h2 className={this.classes.formHeading}>Create A New Item</h2>
            <label
              For="newItemName"
            >
              Add New Item Name: {'  '}
            </label>
            <input
              type="text"
              id="newItemName"
              value={this.data.newItemName}
              onChange={this.handleChange}
            />
            <div
              className={this.classes.buttonContainer}
            >
            <input
              type="submit"
              value="Create New Item"
              className={this.classes.createButton}
            />
            </div>
        </form>
        </div>
        <div className={this.classes.categoryFilter}>
        <h1>Filter By Category</h1>
        <div>
              {this.data.categories.length?
                fu.mapElements(this.data.categories, (button)=>{
                  return (<button
                      onClick={(e)=>{this.handleClick(e, button)}}
                      className={this.classes.updateButton}
                      id={button.name}
                      key={button.id}
                      style={`font-size: 1.5rem;`}
                      >
                      {button.name}
                    </button>)
                }):
                ''
              }
              <div className={this.classes.formContainer}>
              <form
                className={this.classes.form}
                onSubmit={this.createCategory}>
              <input
                type="text"
                id="newCategoryName"
                onChange={this.handleChange}
                placeholder={'Add Category'}
                value={this.data.newCategoryName}
                />
              <input
                  type="submit"
                  className={this.classes.createButton}
                  style={`font-size: 1.5rem;`}
                  value="Create a Category"
                />
                </form>
                </div>
           </div>
        </div>
          <ul className={this.classes.itemsContainer}>
              {
                this.data.items.length && fu.mapElements( this.data.items, (item)=>{
                  return (
                      <li className={this.classes.itemCard}>
                       <h1>{item.name}</h1>
                       <p>{item.name}</p>
                       <div className={this.classes.buttonContainer}>
                        <button className={this.classes.updateButton}>Update</button>
                        <button onClick={(e)=>{
                          this.handleDeleteItem(e, item.id)
                        }} className={this.classes.deleteButton}>Delete</button>
                       </div>
                      </li>
                  )
                })
              }
          </ul>

    </div>
    )
  }
}

render(<BidOpsExample />, document.getElementById('app'))
