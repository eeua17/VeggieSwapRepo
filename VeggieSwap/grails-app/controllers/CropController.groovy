class CropController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cropInstanceList: Crop.list(params), cropInstanceTotal: Crop.count()]
    }

    def create = {
        def cropInstance = new Crop()
        cropInstance.properties = params
        return [cropInstance: cropInstance]
    }

    def save = {
        def cropInstance = new Crop(params)
        if (cropInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'crop.label', default: 'Crop'), cropInstance.id])}"
            redirect(action: "show", id: cropInstance.id)
        }
        else {
            render(view: "create", model: [cropInstance: cropInstance])
        }
    }

    def show = {
        def cropInstance = Crop.get(params.id)
        if (!cropInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crop.label', default: 'Crop'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cropInstance: cropInstance]
        }
    }

    def edit = {
        def cropInstance = Crop.get(params.id)
        if (!cropInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crop.label', default: 'Crop'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cropInstance: cropInstance]
        }
    }

    def update = {
        def cropInstance = Crop.get(params.id)
        if (cropInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cropInstance.version > version) {
                    
                    cropInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'crop.label', default: 'Crop')] as Object[], "Another user has updated this Crop while you were editing")
                    render(view: "edit", model: [cropInstance: cropInstance])
                    return
                }
            }
            cropInstance.properties = params
            if (!cropInstance.hasErrors() && cropInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'crop.label', default: 'Crop'), cropInstance.id])}"
                redirect(action: "show", id: cropInstance.id)
            }
            else {
                render(view: "edit", model: [cropInstance: cropInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crop.label', default: 'Crop'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cropInstance = Crop.get(params.id)
        if (cropInstance) {
            try {
                cropInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'crop.label', default: 'Crop'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'crop.label', default: 'Crop'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crop.label', default: 'Crop'), params.id])}"
            redirect(action: "list")
        }
    }
}
