module ForemanProxmox
  class VmController < ApplicationController
    
    def create_vm
      host_id = params[:id]
      host = Host.find(host_id)
      connection = (Connection.last)
      vm = VirtualMachine.new(host, connection)
      vm.create
    end
    
    def delete_vm(vm)
      vm.stop
      vm.delete
    end
  end
end
