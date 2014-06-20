package search.everywhere

import grails.transaction.Transactional

import org.grep4j.core.model.ProfileBuilder
import org.springframework.stereotype.Service


@Service
@Transactional
class ProfileConverterService {

	def searchableFileDAOService;
	def encodingService;

	def convertSearchableFileToGrep4jProfile(String searchableFileName) {

		SearchableFile searchableFile = searchableFileDAOService.getSearchableFile(searchableFileName)

		if(searchableFile.url == "localhost"){
			return ProfileBuilder.newBuilder()
			.name(searchableFile.name)
			.filePath(searchableFile.path).onLocalhost().build();
		}else{
			return ProfileBuilder.newBuilder()
			.name(searchableFile.name)
			.filePath(searchableFile.path).onRemotehost(searchableFile.url).credentials(searchableFile.user, encodingService.decodeBase64(searchableFile.password)).build();
		}
	}
}





