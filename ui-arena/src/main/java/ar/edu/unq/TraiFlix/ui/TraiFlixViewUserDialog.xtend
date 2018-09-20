package ar.edu.unq.TraiFlix.ui

import ar.edu.unq.TraiFlix.ui.modelsui.UserMod
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label

class TraiFlixViewUserDialog extends Dialog<UserMod>{
	
	new(WindowOwner owner, UserMod model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "TraiFlix Administrar Usuario"
		
		var userPanel = new Panel(mainPanel)
		userPanel.layout = new ColumnLayout(2)
		new Label(userPanel) =>[
			text = "Nombre"
			fontSize= 12
			]
		new Label(userPanel) =>[
			text = modelObject.name
			fontSize= 12
			]
					new Label(userPanel) =>[
			text = "Nick"
			fontSize= 12
			]
		new Label(userPanel) =>[
			text = modelObject.nick
			fontSize= 12
			]
					new Label(userPanel) =>[
			text = "Edad"
			fontSize= 12
			]
		new Label(userPanel) =>[
			text = modelObject.age.toString
			fontSize= 12
			]
	}
	


	
}