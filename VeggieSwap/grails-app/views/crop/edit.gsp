


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'crop.label', default: 'Crop')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cropInstance}">
            <div class="errors">
                <g:renderErrors bean="${cropInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${cropInstance?.id}" />
                <g:hiddenField name="version" value="${cropInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="produce"><g:message code="crop.produce.label" default="Produce" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropInstance, field: 'produce', 'errors')}">
                                    <g:select name="produce.id" from="${Produce.list()}" optionKey="id" value="${cropInstance?.produce?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="grower"><g:message code="crop.grower.label" default="Grower" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropInstance, field: 'grower', 'errors')}">
                                    <g:select name="grower.id" from="${VeggieUser.list()}" optionKey="id" value="${cropInstance?.grower?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="plantDate"><g:message code="crop.plantDate.label" default="Plant Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropInstance, field: 'plantDate', 'errors')}">
                                    <g:datePicker name="plantDate" precision="day" value="${cropInstance?.plantDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estHarvestDate"><g:message code="crop.estHarvestDate.label" default="Est Harvest Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropInstance, field: 'estHarvestDate', 'errors')}">
                                    <g:datePicker name="estHarvestDate" precision="day" value="${cropInstance?.estHarvestDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estYield"><g:message code="crop.estYield.label" default="Est Yield" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropInstance, field: 'estYield', 'errors')}">
                                    <g:textField name="estYield" value="${cropInstance?.estYield}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="actHarvestDate"><g:message code="crop.actHarvestDate.label" default="Act Harvest Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropInstance, field: 'actHarvestDate', 'errors')}">
                                    <g:datePicker name="actHarvestDate" precision="day" value="${cropInstance?.actHarvestDate}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="actYield"><g:message code="crop.actYield.label" default="Act Yield" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropInstance, field: 'actYield', 'errors')}">
                                    <g:textField name="actYield" value="${cropInstance?.actYield}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comments"><g:message code="crop.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropInstance, field: 'comments', 'errors')}">
                                    
<ul>
<g:each in="${cropInstance?.comments?}" var="c">
    <li><g:link controller="cropComment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="cropComment" action="create" params="['crop.id': cropInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cropComment.label', default: 'CropComment')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
