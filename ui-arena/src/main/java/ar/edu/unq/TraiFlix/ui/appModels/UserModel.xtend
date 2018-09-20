package ar.edu.unq.TraiFlix.ui.appModels

import ar.edu.unq.TraiFlix.models.User
import ar.edu.unq.TraiFlix.ui.TraiFlixMainWindow
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.joda.time.Period
import org.joda.time.LocalDate
import ar.edu.unq.TraiFlix.ui.modelsui.UserMod
import java.util.ArrayList

@Accessors
@Observable
class UserModel{
	
	User selectedUser
	
	List<UserMod> filteredUsers
	List<UserMod> userDefault
	String filterUser
	
	TraiFlixMainWindow view
	
	new(List<User> users) {
		var mods = usersToUsersMods(users)
		this.filterUser = ""
		this.userDefault = mods
		this.filteredUsers = mods
	}
	
	def usersToUsersMods(List<User> users) {
		var mods = new ArrayList<UserMod>()
		for(User user : users)
			mods.add(toMod(user))
		mods
	}
	
	def toMod(User user) {
		new UserMod() =>[
			name = user.name
			nick = user.nick
			birtday = user.dateOfBirth
			registration = user.created
		]
	}
	
	//--- FILTRO USER ---//
		def void setFilterUser(String newFilter) {
		this.filterUser = newFilter.toLowerCase
		searchUser()
	}
	
		def searchUser() {
		this.filteredUsers = this.userDefault.filter[it.nick.toLowerCase.contains(filterUser)].toList
	}
	
		def getYear(User user){
			Period.fieldDifference(user.dateOfBirth.toLocalDate, LocalDate.now).getYears();
		}
	
}
