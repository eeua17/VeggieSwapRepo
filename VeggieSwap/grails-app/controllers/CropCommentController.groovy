class CropCommentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cropCommentInstanceList: CropComment.list(params), cropCommentInstanceTotal: CropComment.count()]
    }

    def create = {
        def cropCommentInstance = new CropComment()
        cropCommentInstance.properties = params
        return [cropCommentInstance: cropCommentInstance]
    }

    def save = {
        def cropCommentInstance = new CropComment(params)
        if (cropCommentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cropComment.label', default: 'CropComment'), cropCommentInstance.id])}"
            redirect(action: "show", id: cropCommentInstance.id)
        }
        else {
            render(view: "create", model: [cropCommentInstance: cropCommentInstance])
        }
    }

    def show = {
        def cropCommentInstance = CropComment.get(params.id)
        if (!cropCommentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cropComment.label', default: 'CropComment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cropCommentInstance: cropCommentInstance]
        }
    }

    def edit = {
        def cropCommentInstance = CropComment.get(params.id)
        if (!cropCommentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cropComment.label', default: 'CropComment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cropCommentInstance: cropCommentInstance]
        }
    }

    def update = {
        def cropCommentInstance = CropComment.get(params.id)
        if (cropCommentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cropCommentInstance.version > version) {
                    
                    cropCommentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cropComment.label', default: 'CropComment')] as Object[], "Another user has updated this CropComment while you were editing")
                    render(view: "edit", model: [cropCommentInstance: cropCommentInstance])
                    return
                }
            }
            cropCommentInstance.properties = params
            if (!cropCommentInstance.hasErrors() && cropCommentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cropComment.label', default: 'CropComment'), cropCommentInstance.id])}"
                redirect(action: "show", id: cropCommentInstance.id)
            }
            else {
                render(view: "edit", model: [cropCommentInstance: cropCommentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cropComment.label', default: 'CropComment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cropCommentInstance = CropComment.get(params.id)
        if (cropCommentInstance) {
            try {
                cropCommentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cropComment.label', default: 'CropComment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cropComment.label', default: 'CropComment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cropComment.label', default: 'CropComment'), params.id])}"
            redirect(action: "list")
        }
    }
}
