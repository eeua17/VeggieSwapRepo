

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cropComment.label', default: 'CropComment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'cropComment.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="content" title="${message(code: 'cropComment.content.label', default: 'Content')}" />
                        
                            <th><g:message code="cropComment.parent.label" default="Parent" /></th>
                        
                            <th><g:message code="cropComment.author.label" default="Author" /></th>
                        
                            <th><g:message code="cropComment.crop.label" default="Crop" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cropCommentInstanceList}" status="i" var="cropCommentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cropCommentInstance.id}">${fieldValue(bean: cropCommentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: cropCommentInstance, field: "content")}</td>
                        
                            <td>${fieldValue(bean: cropCommentInstance, field: "parent")}</td>
                        
                            <td>${fieldValue(bean: cropCommentInstance, field: "author")}</td>
                        
                            <td>${fieldValue(bean: cropCommentInstance, field: "crop")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cropCommentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
