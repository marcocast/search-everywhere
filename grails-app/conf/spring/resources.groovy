import search.everywhere.SearchEverywhereCacheService

// Place your Spring DSL code here
beans = {
	searchEverywhereCacheService(SearchEverywhereCacheService) { bean ->
		bean.autowire = 'byName'
	}
}