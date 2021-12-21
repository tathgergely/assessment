# Business logic

Start page: Master View

## Master View
- Load repositories from github.
- While loading show shimmering grey cards
- When error happens show error message (preferably one that describes the error)
- Listview, with items loaded from network source (Github Rest API)
- Clicking on one item should show details view, passing the item's id.
- Item data:
    - title
    - number
    - creation date
    - author login
    - labels with the correct color
    
## Details View
- Constructor parameter (of it's viewmodel/controller): id 
- Full page dialog: dismissable by back button or X icon on Appbar (left corner)
- Data:
    - title
    - number
    - creation date
    - author login
    - author avatar
    - labels with the correct color
    - description
	- only the text part is required
	- but fell free to go with markdown rendering, code highlight and images if you like

