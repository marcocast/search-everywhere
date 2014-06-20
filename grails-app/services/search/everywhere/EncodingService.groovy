package search.everywhere


import grails.transaction.Transactional

import org.springframework.stereotype.Service


@Service
@Transactional
class EncodingService {

	def econdeBase64(String s) {
		s.bytes.encodeBase64().toString()
	}


	def decodeBase64(String s) {
		byte[] decoded = s.decodeBase64()
		return new String(decoded)
	}
}
