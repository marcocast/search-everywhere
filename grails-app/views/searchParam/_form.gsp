<%@ page import="search.everywhere.SearchParam"%>
<%@ page import="search.everywhere.SearchableFile"%>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>

<fieldset>

	<section>
		<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'identifier', 'error')} ">

			<label class="input"> <g:hiddenField name="identifier"
					value="${searchParamInstance?.identifier}" />
			</label>

		</div>
	</section>

	<section>

		<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'name', 'error')} required">
			<label class="label" for="name"> <g:message code="searchParam.name.label" default="Name" />
				<span class="required-indicator">*</span>
			</label> <label class="input"> <g:textField name="name" required=""
					value="${searchParamInstance?.name}" />
			</label>

		</div>
	</section>

	<section>

		<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'text', 'error')} required">
			<label class="label" for="name"> <g:message code="searchParam.text.label" default="Text" />
				<span class="required-indicator">*</span>
			</label> <label class="input"> <g:textField name="text" required=""
					value="${searchParamInstance?.text}" />
			</label>

		</div>
	</section>

	<section>

		<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'regex', 'error')} ">
		
		
			<g:if test="${searchParamInstance != null && searchParamInstance.regex}">
				<label class="toggle pull-left text-left"> <input type="checkbox" name="regex"
					checked="checked"> <i data-swchon-text="ON" data-swchoff-text="OFF"></i>Regex
				</label>
			</g:if>
			<g:else>
				<label class="toggle pull-left text-left"> <input type="checkbox" name="regex">
					<i data-swchon-text="ON" data-swchoff-text="OFF"></i>Regex
				</label>
			</g:else>
			<br>
		</div>
	</section>




	<section>

		<div
			class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'searchableFileNames', 'error')} required">
			<label for="searchableFileNames" class="label">Select Searchable files</label> 
			<span class="required-indicator">*</span>
			<label class="select select-multiple"> <select name="pnames" multiple style="width: 100%" class="select2">
					<g:each in="${searchableFileDAOService.getAllSearchableFiles()}" status="i" var="searchableFileInstance">

						<g:if
							test="${searchParamInstance?.searchableFileNames != null && searchParamInstance?.searchableFileNames.contains(searchableFileInstance.identifier)}">
							<option value="${searchableFileInstance.identifier}" selected>
								${searchableFileInstance.name}
							</option>
						</g:if>
						<g:else>
							<option value="${searchableFileInstance.identifier}">
								${searchableFileInstance.name}
							</option>
						</g:else>

					</g:each>

			</select>

			</label>

			<div class="note">
				<strong>Note:</strong>type or click on the field to add multiple searchable files.
			</div>

		</div>
	</section>



</fieldset>