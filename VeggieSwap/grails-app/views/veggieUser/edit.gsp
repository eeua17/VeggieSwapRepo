


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'veggieUser.label', default: 'VeggieUser')}" />
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
            <g:hasErrors bean="${veggieUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${veggieUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${veggieUserInstance?.id}" />
                <g:hiddenField name="version" value="${veggieUserInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fullName"><g:message code="veggieUser.fullName.label" default="Full Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'fullName', 'errors')}">
                                    <g:textField name="fullName" value="${veggieUserInstance?.fullName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="userName"><g:message code="veggieUser.userName.label" default="User Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'userName', 'errors')}">
                                    <g:textField name="userName" value="${veggieUserInstance?.userName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="veggieUser.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${veggieUserInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="veggieUser.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${veggieUserInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="aboutMe"><g:message code="veggieUser.aboutMe.label" default="About Me" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'aboutMe', 'errors')}">
                                    <g:textArea name="aboutMe" cols="40" rows="5" value="${veggieUserInstance?.aboutMe}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="website"><g:message code="veggieUser.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${veggieUserInstance?.website}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="postcode"><g:message code="veggieUser.postcode.label" default="Postcode" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'postcode', 'errors')}">
                                    <g:textField name="postcode" value="${veggieUserInstance?.postcode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="crops"><g:message code="veggieUser.crops.label" default="Crops" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'crops', 'errors')}">
                                    
<ul>
<g:each in="${veggieUserInstance?.crops?}" var="c">
    <li><g:link controller="crop" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="crop" action="create" params="['veggieUser.id': veggieUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'crop.label', default: 'Crop')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="friends"><g:message code="veggieUser.friends.label" default="Friends" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'friends', 'errors')}">
                                    <g:select name="friends" from="${VeggieUser.list()}" multiple="yes" optionKey="id" size="5" value="${veggieUserInstance?.friends*.id}" />
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
