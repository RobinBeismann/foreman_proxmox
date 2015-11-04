module ForemanProxmox
  class ProxmoxserversController < ApplicationController
    
    def index
      @proxmoxservers = Proxmoxserver.order.all
    end
    
    def show
      @proxmox = Proxmoxserver.find(params[:id])
    end
    
      
    def new
      @proxmox = Proxmoxserver.new
    end
    
    def create
      Proxmoxserver.create(params[:proxmoxserver])
      redirect_to '/proxmox'
    end
    
    def edit
      @proxmox = Proxmoxserver.find(params[:id])
    end
    
    def update
      proxmox = Proxmoxserver.find(params[:id])
      proxmox.update_attributes(params[:proxmoxserver])
      proxmox.save
    end
    
    def destroy
      Proxmoxserver.find(params[:id]).delete
      redirect_to '/proxmox'
    end
    
    def setcurrent
      oldcurrent = Proxmoxserver.all
      oldcurrent.each do |old|
        old.current = false
        old.save
      end
      newcurrent = Proxmoxserver.find(params[:id])
      newcurrent.current= true
      newcurrent.save
      redirect_to :back
    end
    
  end
end
