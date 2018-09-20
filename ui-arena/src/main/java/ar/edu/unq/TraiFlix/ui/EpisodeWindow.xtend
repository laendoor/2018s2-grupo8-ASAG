package ar.edu.unq.TraiFlix.ui

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unq.TraiFlix.ui.appModels.EpisodeManagementAppModel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout

class EpisodeWindow extends Dialog<EpisodeManagementAppModel> {
	
	new(WindowOwner owner, EpisodeManagementAppModel model) {
		super(owner, model)
	}
	
		override createErrorsPanel(Panel mainPanel) {}
	
	
	
	override protected createFormPanel(Panel mainPanel) {
			
		// Build general information panel...
		createSerieHeadPanel(mainPanel)
		
		new Panel(mainPanel)=>[
			layout = new HorizontalLayout
			//build left panel
			createLeftPanel(it)
		
			//build rigth panel
			createRihgtPanel(it)
			]
		
		// Build ok/cancel button panel...
		createOkCancelButtonPanel(mainPanel)
			
	}
	
	
	private def createLeftPanel(Panel parentPanel){
		
			new Panel (parentPanel)=>[
				
				layout = new VerticalLayout
				new Label(it)=>[
							text="Titulo "
							height = 30
							alignRight
							]
				new Label(it)=>[  
							text="#Temporada"
							height = 27
							alignRight
							]
				
				new Label(it)=>[
							text="Fecha de estreno "
							height = 27
							alignRight
							]
				new Label(it)=>[
							text="Directores "
							height = 28
							alignRight
							]
				new Label(it)=>[
							text="Actores"
							height = 28
							alignRight
							]
				new Label(it)=>[
							text="Link Youtube"
							height = 28
							alignRight
							]
			]
		}
	
	private def createRihgtPanel(Panel parentPanel){
		
		new Panel (parentPanel)=>[
		
			//title textBox
			new TextBox(it)=>[
						value<=> "episode.title"
						alignLeft
						height = 17
						width = 300
					]
			
			//3 column panel
			new Panel(it)=>[
				layout = new ColumnLayout(3)
				
				
			/**  new TextBox(form) => [
            withFilter [ event | event.potentialTextResult.matches("[0-9,.]*") ]
            bindValueToProperty("numero")
            width = 100
        								] */
				
				
				//TextBox Temporada
				new TextBox(it)=>[
							//solo se puede  ingresar  0 a 3 numeros, sin punt decimal
							withFilter[	event| event.potentialTextResult.matches("[0-9]{0,3}")]
							value<=> "episode.season"
							alignLeft
							height = 17
							]
							width = 100
					
				//label #Capitulo
				new Label(it)=>[
					text="#Capitulo "
					alignRight
					height = 27
					]
				//TextBox Capitulo
				new TextBox(it)=>[
							//solo se puede  ingresar  0 a 3 numeros, sin punt decimal
							withFilter[	event| event.potentialTextResult.matches("[0-9]{0,3}")]
							value<=> "episode.episodeNumber"
							alignRight
							height = 17
						//	width = 400
					]
				
				//TextBox fecha de estreno
				new TextBox(it)=>[
							value<=> "episode.release"
							alignLeft
							height = 17
						//	width = 400
					]
				//label Duracion
				new Label(it)=>[
					text="Duracion "
					alignRight
					height = 27
					]
				//TextBox Duration
				new TextBox(it)=>[
						value<=> "episode.duration"
						alignRight
						height = 17
					//	width = 400
					]
				
				]//fin 3 columnas layout
				
			//directos textBox
			new TextBox(it)=>[
						value<=> "episode.directors"
						alignLeft
						height = 19
					//	width = 400
					]
			//actors textBox
			new TextBox(it)=>[
						value<=> "episode.actors"
						alignLeft
						height = 19
					//	width = 400
					]
			
			//link textBox
			new TextBox(it)=>[
						value<=> "episode.link"
						alignLeft
						height = 19
					//	width = 400
					]
		]
				
	}
	
	
	private def createSerieHeadPanel(Panel parentPanel) {
					
		new Panel(parentPanel) => [
			layout = new HorizontalLayout
			new Label(it) => [ 
				text = "Serie: "
				 ]
			new Label(it) => [ 
				value.bindToProperty("episode.serie.title")				]
		]
		
	}
	
	private def createOkCancelButtonPanel(Panel parentPanel) {
		
		// Cancel/Ok button panel...			
		new Panel(parentPanel) => [
			layout = new HorizontalLayout
			new Button(it) => [ 
				caption = "Cancelar"
				alignCenter
				width = 200
				onClick [ | this.cancel ]
			]
			new Button(it) => [ 
				caption = "Aceptar"
				alignCenter
				width = 200
				onClick [ | this.accept ]
			]				
		]
		
	}
	
		
}