export const mainColor = `rgba(253, 252, 241, 0.3)`,
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
export const styles = {
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
  categoryFilter:{
    display:'block',
    '& > h1':{
      color:'white',
      textAlign: 'center'

    },
    '&  label':{
      color:'white'
    }
  }
}
