package search.everywhere


class SearchParam {

	String identifier
	String name
	static hasMany = [searchableFileNames:String]
	boolean regex
	String text


	static constraints = {
		name size: 5..15, blank: false, nullable: false, validator: {
			if (it.isEmpty() ||it.indexOf('/') > -1 || it.indexOf('?') > -1 || it.indexOf('|') > -1 ||it.indexOf('{') > -1 || it.indexOf('}') > -1 || it.indexOf('_') > -1 || it.indexOf('[') > -1 || it.indexOf(']') > -1 || it.indexOf('*') > -1 || it.indexOf('-') > -1) return ['invalid.bountyhunter']
		}
		identifier nullable: true
		regex nullable: false
		text nullable: false
		searchableFileNames size: 1..100
	}
}
