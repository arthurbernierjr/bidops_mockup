import { Komponent , render, fu} from 'kofujs'
// assign colors and style objects
const mainColor = `rgba(253, 252, 241, 0.3)`,
        brightOrange = '#ff1e00',
        dimlyBlue= '#e8f9fd',
        successGreen= '#59ce8f',
        creativeBlue = '#000099',
        borderRadius = { borderRadius: '2rem'},
        buttonStyle = {
          boxShadow: '0 4px 8px 0 rgba(0,0,0,0.2)',
            transition: '0.3s',
            color: 'white',
            margin: '0 1vw',
            '&:hover':{
              boxShadow: '0 16px 32px 0 rgba(0,0,0,0.5)'
            }},
            paragraphFont = {fontFamily: 'Lemonada, cursive'};
// create Komponent Style Sheet JSS
const styles = {
  mainPageHeading: {
    backgroundColor: 'red'
  },
  pageContainer:{
    width: '100%',
    display: 'flex',
    flexDirection:'column',
    alignItems:'center'
  },
  formHeading:{
    textAlign:'center',
    textDecoration:'underline'
  },
  itemsContainer: {
    width: '80vw',
    margin: '1rem, 10vw',
    listStyle: 'none',
    padding: '1rem'
  },
  formContainer:{
    display: 'flex',
    justifyContent: 'center'
  },
  form:{
    boxShadow: '0 4px 8px 0 rgba(0,0,0,0.2)',
    transition: '0.3s',
    backgroundColor:mainColor,
    padding: '1rem',
    ...borderRadius,
    '&:hover':{
      boxShadow: '0 8px 16px 0 rgba(0,0,0,0.5)',
    }
  },
  itemCard:{
    boxShadow: '0 4px 8px 0 rgba(0,0,0,0.2)',
    transition: '0.3s',
    minHeight:'8rem',
    backgroundColor:mainColor,
    display: 'flex',
    flexDirection: 'column',
    textAlign: 'center',
    justifyContent:'center',
    alignItems: 'spaceBetween',
    marginBottom: '3rem',
    ...borderRadius,
    '&:hover':{
      boxShadow: '0 16px 32px 0 rgba(0,0,0,0.5)'
    },
    '& > p':{
      ...paragraphFont
    }
  },
  buttonContainer:{
    display: 'flex',
    justifyContent:'center',
    margin: '1vw 0'
  },
  createButton: {
    backgroundColor: successGreen,
    ...borderRadius,
    ...buttonStyle
  },
  updateButton: {
    backgroundColor: creativeBlue,
    ...borderRadius,
    ...buttonStyle
  },
  deleteButton: {
    backgroundColor: brightOrange,
    ...borderRadius,
    ...buttonStyle
  },
  modal:{
    display:'block'
  }
}
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
      filteredItems: [],
      updateItemName: '',
      updateCategoryName: ''
    }
    this.getItems = this.getItems.bind(this);
    this.handleCreateItem = this.handleCreateItem.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleUpdateItem = this.handleUpdateItem.bind(this);
  }
  async komponentDidMount () {
    console.log('Hello world')
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
     const response = await fetch('http://localhost:3006/items',
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
  async handleDeleteItem (event){

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
              HTMLFor="newItemName"
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
          <ul className={this.classes.itemsContainer}>
              {
                this.data.items.length && fu.mapElements( this.data.items, (item)=>{
                  return (
                      <li className={this.classes.itemCard}>
                       <h1>{item.name}</h1>
                       <p>{item.name}</p>
                       <div className={this.classes.buttonContainer}>
                        <button className={this.classes.updateButton}>Update</button>
                        <button className={this.classes.deleteButton}>Delete</button>
                       </div>
                      </li>
                  )
                })
              }
          </ul>
          <div className={this.classes.modal}>
          <form>
             <select>
                {this.data.categories.length?
                  fu.mapElements(this.data.categories, (cat)=>{
                    return (<option
                      value={cat.name}
                      key={cat.id}
                      >
                        {cat.name}
                      </option>)
                  }, 'select'):
                  ''
                }
             </select>
             </form>
          </div>
    </div>
    )
  }
}

render(<BidOpsExample />, document.getElementById('app'))
