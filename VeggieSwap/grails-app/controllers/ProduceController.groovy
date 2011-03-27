class ProduceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [produceInstanceList: Produce.list(params), produceInstanceTotal: Produce.count()]
    }

    def create = {
        def produceInstance = new Produce()
        produceInstance.properties = params
        return [produceInstance: produceInstance]
    }

    def save = {
        def produceInstance = new Produce(params)
        if (produceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'produce.label', default: 'Produce'), produceInstance.id])}"
            redirect(action: "show", id: produceInstance.id)
        }
        else {
            render(view: "create", model: [produceInstance: produceInstance])
        }
    }

    def show = {
        def produceInstance = Produce.get(params.id)
        if (!produceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'produce.label', default: 'Produce'), params.id])}"
            redirect(action: "list")
        }
        else {
            [produceInstance: produceInstance]
        }
    }

    def edit = {
        def produceInstance = Produce.get(params.id)
        if (!produceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'produce.label', default: 'Produce'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [produceInstance: produceInstance]
        }
    }

    def update = {
        def produceInstance = Produce.get(params.id)
        if (produceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (produceInstance.version > version) {
                    
                    produceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'produce.label', default: 'Produce')] as Object[], "Another user has updated this Produce while you were editing")
                    render(view: "edit", model: [produceInstance: produceInstance])
                    return
                }
            }
            produceInstance.properties = params
            if (!produceInstance.hasErrors() && produceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'produce.label', default: 'Produce'), produceInstance.id])}"
                redirect(action: "show", id: produceInstance.id)
            }
            else {
                render(view: "edit", model: [produceInstance: produceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'produce.label', default: 'Produce'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def produceInstance = Produce.get(params.id)
        if (produceInstance) {
            try {
                produceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'produce.label', default: 'Produce'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'produce.label', default: 'Produce'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'produce.label', default: 'Produce'), params.id])}"
            redirect(action: "list")
        }
    }
}
