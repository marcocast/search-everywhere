package search.everywhere


class SearchParam {

	String identifier
	String name
	static hasMany = [searchableFileNames:String]
	boolean regex
	String text


	static constraints = {
		name blank: false, nullable: false
		identifier nullable: true
		regex nullable: false
		text nullable: false
	}
}
