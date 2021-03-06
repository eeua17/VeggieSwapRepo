


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'produce.label', default: 'Produce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${produceInstance}">
            <div class="errors">
                <g:renderErrors bean="${produceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="produce.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produceInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${produceInstance.constraints.type.inList}" value="${produceInstance?.type}" valueMessagePrefix="produce.type"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subtype"><g:message code="produce.subtype.label" default="Subtype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produceInstance, field: 'subtype', 'errors')}">
                                    <g:textField name="subtype" value="${produceInstance?.subtype}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="produce.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produceInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${produceInstance?.description}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
