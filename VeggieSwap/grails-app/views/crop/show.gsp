

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'crop.label', default: 'Crop')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cropInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.produce.label" default="Produce" /></td>
                            
                            <td valign="top" class="value"><g:link controller="produce" action="show" id="${cropInstance?.produce?.id}">${cropInstance?.produce?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.grower.label" default="Grower" /></td>
                            
                            <td valign="top" class="value"><g:link controller="veggieUser" action="show" id="${cropInstance?.grower?.id}">${cropInstance?.grower?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.plantDate.label" default="Plant Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${cropInstance?.plantDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.estHarvestDate.label" default="Est Harvest Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${cropInstance?.estHarvestDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.estYield.label" default="Est Yield" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cropInstance, field: "estYield")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.actHarvestDate.label" default="Act Harvest Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${cropInstance?.actHarvestDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.actYield.label" default="Act Yield" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cropInstance, field: "actYield")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="crop.comments.label" default="Comments" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${cropInstance.comments}" var="c">
                                    <li><g:link controller="cropComment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${cropInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
