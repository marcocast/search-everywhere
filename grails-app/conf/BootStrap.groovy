class BootStrap {

	def init = { servletContext ->
		def userHomeFolder  = System.getProperty("user.home")
		def searchEverywhereHomeFolder = userHomeFolder + "/.search-everywhere"
		if(!new File(searchEverywhereHomeFolder).exists()){
			new File( searchEverywhereHomeFolder ).mkdir()
			new File( searchEverywhereHomeFolder + "/searchable-files" ).mkdir()
		}
	}


	def destroy = {
	}
}
