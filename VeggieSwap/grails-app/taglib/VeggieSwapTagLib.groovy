class VeggieSwapTagLib {

  def messageThread = {attrs ->
    def cropComments = attrs.crops.findAll{comment -> !comment.parent}
    processCropComments(cropComments, 0)
  }
  
  void processCropComments(cropComments, indent){
    cropComments.each{comment ->

      def body = "${comment?.author} - ${comment?.subject}"
      out << "<div style='height:30; margin-left:${indent * 20};'>"
      out << "${remoteLink(action:'showDetail', id:comment.id, update:'details', body)}"
      out << "</div>"
      
      def children = CropComment.findAllByParent(comment)
      if (children){
          processCropComments(children, indent + 1)
      }
    }
  }

    def loginToggle = {
        out << "<div>"
        if(session.user){
            out << "<span style='float:left'>"
            out << "Welcome ${session.user}."
            out << "</span><span style='float:right;margin-right:10px'>"
            out << "<a href='${createLink(controller:'veggieUser', action:'logout')}'>"
            out << "Logout </a></span>"
        }
        else {
            out << "<span style='float:right;margin-right:10px'>"
            out << "<a href='${createLink(controller:'veggieUser', action:'login')}'>"
            out << "Login </a></span>"
        }
        out << "</div><br/>"
    }
}
