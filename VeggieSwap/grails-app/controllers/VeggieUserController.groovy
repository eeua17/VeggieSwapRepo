class VeggieUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [veggieUserInstanceList: VeggieUser.list(params), veggieUserInstanceTotal: VeggieUser.count()]
    }

    def create = {
        def veggieUserInstance = new VeggieUser()
        veggieUserInstance.properties = params
        return [veggieUserInstance: veggieUserInstance]
    }

    def save = {
        def veggieUserInstance = new VeggieUser(params)
        if (veggieUserInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'veggieUser.label', default: 'VeggieUser'), veggieUserInstance.id])}"
            redirect(action: "show", id: veggieUserInstance.id)
        }
        else {
            render(view: "create", model: [veggieUserInstance: veggieUserInstance])
        }
    }

    def show = {
        def veggieUserInstance = VeggieUser.get(params.id)
        if (!veggieUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'veggieUser.label', default: 'VeggieUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            [veggieUserInstance: veggieUserInstance]
        }
    }

    def edit = {
        def veggieUserInstance = VeggieUser.get(params.id)
        if (!veggieUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'veggieUser.label', default: 'VeggieUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [veggieUserInstance: veggieUserInstance]
        }
    }

    def update = {
        def veggieUserInstance = VeggieUser.get(params.id)
        if (veggieUserInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (veggieUserInstance.version > version) {
                    
                    veggieUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'veggieUser.label', default: 'VeggieUser')] as Object[], "Another user has updated this VeggieUser while you were editing")
                    render(view: "edit", model: [veggieUserInstance: veggieUserInstance])
                    return
                }
            }
            veggieUserInstance.properties = params
            if (!veggieUserInstance.hasErrors() && veggieUserInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'veggieUser.label', default: 'VeggieUser'), veggieUserInstance.id])}"
                redirect(action: "show", id: veggieUserInstance.id)
            }
            else {
                render(view: "edit", model: [veggieUserInstance: veggieUserInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'veggieUser.label', default: 'VeggieUser'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def veggieUserInstance = VeggieUser.get(params.id)
        if (veggieUserInstance) {
            try {
                veggieUserInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'veggieUser.label', default: 'VeggieUser'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'veggieUser.label', default: 'VeggieUser'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'veggieUser.label', default: 'VeggieUser'), params.id])}"
            redirect(action: "list")
        }
    }
}
