class BootStrap {

	def init = { servletContext ->
		def userHomeFolder  = System.getProperty("user.home")
		def searchEverywhereHomeFolder = userHomeFolder + "/.search-everywhere"
		if(!new File(searchEverywhereHomeFolder).exists()){
			println  "creating search-everywhere home folder"
			new File( userHomeFolder + "/.search-everywhere" ).mkdir()
		}
		println  "done"
	}





	def destroy = {
	}
}
