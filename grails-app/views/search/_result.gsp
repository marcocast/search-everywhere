		<g:each in="${grepsearchResult.results}" status="i" var="singleResult">
			<div role="main" class="result">
				<table class="result">
					<tr>
						<td><label for="result">File : ${singleResult.fileName} , Total lines	found : ${singleResult.totalMatches} 
						</label></td>
					</tr>
					<tr>
						<td><g:textArea name="result" value="${singleResult.result}"
								rows="${singleResult.totalMatches}" cols="1" /></td>
					</tr>
				</table>
			</div>
		</g:each>
