package search.everywhere


class SearchableFile {

	String identifier;
	String name;
	String url;
	String path;
	String user;
	String password;

	static constraints = {
		name size: 5..15, blank: false, nullable: false, validator: {
			if (it.isEmpty() ||  it.indexOf('/') > -1 || it.indexOf('?') > -1 || it.indexOf('|') > -1 ||it.indexOf('{') > -1 || it.indexOf('}') > -1 || it.indexOf('_') > -1 || it.indexOf('[') > -1 || it.indexOf(']') > -1 || it.indexOf('*') > -1 || it.indexOf('-') > -1) return ['invalid.bountyhunter']
		}
		identifier nullable: true
		url nullable: false, blank: false
		path nullable: false, blank: false
		password nullable: true
		user nullable: true
	}
}
