

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'veggieUser.label', default: 'VeggieUser')}" />
        <title>${fieldValue(bean:veggieUserInstance, field:'userName')}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>${fieldValue(bean:veggieUserInstance, field:'userName')}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr>
                        <a href="mailto:${veggieUserInstance.email}">Email me</a>
                            
                        </tr>
                                       
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="veggieUser.aboutMe.label" default="About Me" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: veggieUserInstance, field: "aboutMe")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="veggieUser.website.label" default="Website" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: veggieUserInstance, field: "website")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="veggieUser.postcode.label" default="Postcode" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: veggieUserInstance, field: "postcode")}</td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="veggieUser.crops.label" default="Crops" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${veggieUserInstance.crops}" var="c">
                                    <ul><g:link controller="crop" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></ul>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="veggieUser.friends.label" default="Friends" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${veggieUserInstance.friends}" var="f">
                                    <ul><g:link controller="veggieUser" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></ul>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${veggieUserInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
