


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cropComment.label', default: 'CropComment')}" />
        <title>Comment on this crop</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list" id="${cropCommentInstance?.crop?.id}">Comments</g:link></span>
        </div>
        <div class="body">
            <h1>${cropCommentInstance?.crop.encodeAsHTML()} - New Comment</h1>
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
                          
                        <g:if test="${cropCommentInstance.parent}">
                          <input type ="hidden" name="parent.id" value="${cropCommentInstance.parent.id}"/>
                           <input type ="hidden" name="author" value="${cropCommentInstance.parent.id}"/>
                          <tr class="prop">
                            <td valign ="top" class="name">
                              <label>In Reply to : </label>
                            </td>
                            <td valign="top" class="value">
                              $cropCommentInstance.parent.author}
                            </td>
                          </tr>
                        </g:if>
                          
                          <input type="hidden" name="crop.id" value="${cropCommentInstance?.crop?.id}"/>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content">Comment content : </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cropCommentInstance, field: 'content', 'errors')}">
                                  <textArea class="messageField" rows="5" cols="60" name="content">
                                    ${fieldValue(bean:cropCommentInstance, field:content)}
                                                                        </textArea>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author">Author:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cropCommentInstance,field:'author','errors')}">
                                    <g:select optionKey="id" from="${VeggieUser.list()}" name="author.id" value="${cropCommentInstance?.author?.id}" ></g:select>
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
