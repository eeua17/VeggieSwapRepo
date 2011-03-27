


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cropComment.label', default: 'CropComment')}" />
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
            <g:hasErrors bean="${cropCommentInstance}">
            <div class="errors">
                <g:renderErrors bean="${cropCommentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content"><g:message code="cropComment.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropCommentInstance, field: 'content', 'errors')}">
                                    <g:textArea name="content" cols="40" rows="5" value="${cropCommentInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parent"><g:message code="cropComment.parent.label" default="Parent" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropCommentInstance, field: 'parent', 'errors')}">
                                    <g:select name="parent.id" from="${CropComment.list()}" optionKey="id" value="${cropCommentInstance?.parent?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author"><g:message code="cropComment.author.label" default="Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropCommentInstance, field: 'author', 'errors')}">
                                    <g:select name="author.id" from="${VeggieUser.list()}" optionKey="id" value="${cropCommentInstance?.author?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="crop"><g:message code="cropComment.crop.label" default="Crop" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropCommentInstance, field: 'crop', 'errors')}">
                                    <g:select name="crop.id" from="${Crop.list()}" optionKey="id" value="${cropCommentInstance?.crop?.id}"  />
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
