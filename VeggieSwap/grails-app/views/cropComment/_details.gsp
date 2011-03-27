<div class="dialog">
  <table>

    
    <tr class="prop">
      <td valign="top" class="name">Content:</td>
      <td valign="top" class="value">${fieldValue(bean: cropCommentInstance, field: "content")}</td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name">Author:</td>
      <td valign="top" class="value">
        <g:link controller="veggieUser" action="show" id="${cropCommentInstance?.author?.id}">
          ${cropCommentInstance?.author?.encodeAsHTML()}
          </g:link>
      </td>
    </tr>

  </table>

  <div class="buttons">
    <span class="menuButton">
      <g:link class="create" action="reply" id="${cropCommentInstance?.id}">Reply</g:link>
    </span>
  </div>
</div>