
class BootStrap {

	def searchEverywhereCacheService;


	def init = { servletContext ->
		searchEverywhereCacheService.createFolersIfNotExist()
		searchEverywhereCacheService.loadAllIntoCache()
	}


	def destroy = {
	}
}
