<%@ page import="search.everywhere.ResultDAOService"%>
<g:set var="resultDAOService" bean="resultDAOService" />
<%@ page import="search.everywhere.SearchableFileDAOService"%>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService" />
<form class="smart-form">
	<header>
		<ul class="list-inline">
			<li><small> Text : </small></li>
			<li class="text-success"><strong>
					${result.text}
			</strong></li>
			<li><g:if test="${result.regex==true}">
					<input type="checkbox" name="regex" checked="checked" disabled="disabled">
					<i data-swchon-text="ON" data-swchoff-text="OFF"></i>Regex</label>
				</g:if> <g:else>
					<input type="checkbox" name="regex" disabled="disabled">
					<i data-swchon-text="OFF" data-swchoff-text="OFF"></i>Regex</label>
				</g:else></li>
			<li><small> on </small></li>
			<li>
			<g:link controller="searchableFile" action="show" id="${result.searchableFileNames.first()}" params="[identifier: result.searchableFileNames.first()]">${searchableFileDAOService.getSearchableFile(result.searchableFileNames.first()).name}</g:link>
				</li>
			<li><g:if test="${result.totalMatches > -1 }">
					<small> Total lines found </small>
					<strong class="text-danger">
						${result.totalMatches}
					</strong>
				</g:if> <g:else>
					<section>
						<label class="textarea textarea-resizable"> <strong class="text-danger">
								${result.result}
						</strong>

						</label>
					</section>
				</g:else></li>
			<li>				
					<g:remoteLink controller="search" class="btn btn-primary" action="executeSearch" 
						update="resultBox${result.searchableFileNames.first()}"
						params="'name=${result.identifier}&text=${result.text}&regex=${result.regex}&searchableFileName=${result.searchableFileNames.first()}'">&nbsp;Search again <i
							class="fa fa-refresh">&nbsp;</i>							
					</g:remoteLink>
			

			</li>
		</ul>
	</header>
	<g:if test="${result.totalMatches > -1 }">
		<fieldset>

			<section>
				<label class="textarea textarea-resizable"> <textarea rows="${result.totalMatches + 10}"
						placeholder="Nothing found">
						${resultDAOService.getFullResultText(result.identifier)}
					</textarea>

				</label>
			</section>
		</fieldset>
	</g:if>


</form>

