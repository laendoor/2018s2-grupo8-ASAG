package ar.edu.unq.TraiFlix.ui

import ar.edu.unq.TraiFlix.models.User
import ar.edu.unq.TraiFlix.ui.appModels.UserModel
import java.util.List
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.awt.Color
import org.joda.time.LocalDate
import java.time.Period
import ar.edu.unq.TraiFlix.ui.modelsui.UserMod

class TraiFlixUserAdminWindow extends Dialog<UserModel>{
	
	new(WindowOwner owner, List<User> users) {
		
		super(owner, new UserModel(users))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "TraiFlix Administrar Usuario"
		createTitlePanel(mainPanel, "USUARIOS")
		
		createCrudPanelMovies(mainPanel);	
	
		createButtons(mainPanel)
	}
	
	
	def createButtons(Panel panel) {
		val buttonPanel = new Panel(panel)
		buttonPanel.layout = new HorizontalLayout
			
			new Button(buttonPanel) => [ 
				caption = "Ver"
				alignCenter
				width = 200
				onClick [ | this.cancel ]
			]
			
			new Button(buttonPanel) => [ 
				caption = "Cerrar"
				alignCenter
				width = 200
				//background = Color.BLUE
				onClick [ | this.cancel ]
			]
			
	}
	
	def createTitlePanel(Panel panel, String title) {
		var titlePanel = new Panel(panel)
		
		titlePanel.layout = new ColumnLayout(2)
		
		new Label(titlePanel) =>[
			text = title
			fontSize= 16]
			
		return titlePanel
	
	}
	
	def createCrudPanelMovies(Panel panel) {
		
		var moviePanel = new Panel(panel)

		moviePanel.layout = new HorizontalLayout
		
		var tablePanel = new Panel(moviePanel)
		
		new TextBox(tablePanel)=> [
				value <=> "filterUser"
			]
		
		var table = new Table<UserMod>(tablePanel, typeof(UserMod))=> [
			numberVisibleRows = 3
			items <=> "filteredUsers"
			selection <=> "selectedUser"
		]
		val columns = newArrayList()
		columns.add(new Terna("Usuario","nick",200))
		columns.add(new Terna("Fecha de registración","registrationString",150))
		columns.add(new Terna("Edad","age",250))
	
		createHeadedTable(table,columns)
		
		
	}
	
	def createHeadedTable(Table<UserMod> table, List<Terna<String,String,Integer>> columns) {
		for(Terna<String,String,Integer>column : columns){
			new Column<UserMod>(table) => [
		    title = column.x
		    fixedSize = column.z
		    bindContentsToProperty(column.y)
			]
		}

	}
	
}
	

	
	