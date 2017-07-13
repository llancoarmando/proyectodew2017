require File.join(Rails.root, "app", "models", "Juego.rb")
require File.join(Rails.root, "app", "models", "Cliente.rb")
require File.join(Rails.root, "app", "models", "Solicitud.rb")
require File.join(Rails.root, "app", "models", "Club.rb")
require File.join(Rails.root, "app", "models", "Servicio.rb")

class HomeController < ApplicationController
  def registrar_responsable
    
  end
  
  def registrar_responsable_post
    @txt_nombre_cliente = params[:txt_nombre_cliente] 
    @txt_apellido_paterno = params[:txt_apellido_paterno]
    @txt_apellido_materno = params[:txt_apellido_materno]
    @txt_sexo_cliente = params[:txt_sexo_cliente]
    @txt_tipo_doc = params[:txt_tipo_doc]
    @num_numero_doc = params[:num_numero_doc]
    @txt_correo_cliente = params[:txt_correo_cliente] 
    @num_numero_cel = params[:num_numero_cel]
    @txt_correo_cliente = params[:txt_correo_cliente] 
    @txt_direccion_cliente = params[:txt_direccion_cliente]
    @txt_pass_cliente = params[:txt_pass_cliente] 
    
    Rails.logger.debug("--------------> " + @txt_nombre_cliente)
    Rails.logger.debug("--------------> " + @txt_apellido_paterno)
    Rails.logger.debug("--------------> " + @txt_apellido_materno)
    Rails.logger.debug("--------------> " + @txt_sexo_cliente)
    Rails.logger.debug("--------------> " + @txt_tipo_doc)
    Rails.logger.debug("--------------> " + @num_numero_doc)
    Rails.logger.debug("--------------> " + @txt_correo_cliente)
    Rails.logger.debug("--------------> " + @txt_direccion_cliente)
    Rails.logger.debug("--------------> " + @txt_pass_cliente)
    
    cli =  Cliente.new(:nombre => @txt_nombre_cliente, :apaterno => @txt_apellido_paterno, :amaterno => @txt_apellido_materno, :sexo => @txt_sexo_cliente, :tipodoc => @txt_tipo_doc, :numerodoc => @num_numero_doc, :correo => @txt_correo_cliente, :direccion => @txt_direccion_cliente, :pass => @txt_pass_cliente)
    cli.save
    

    Rails.logger.debug("--------------> " + cli.nombre)
       
    render "registrar_responsable"
  end

  def editar
  end

  def listar_ofertas
  end

  def registrardiacampo
    
    @lclubs = Club.all()
      if @lclubs.nil?
        Rails.logger.debug("--------------> esta vacio!... ")
        else
        @lclubs.each do |c|
          Rails.logger.debug("--------------> " + c.nombre_club)
        end
      end 
      
    @lservicios = Servicio.all()
      if @lservicios.nil?
        Rails.logger.debug("--------------> esta vacio!... ")
        else
        @lservicios.each do |s|
          Rails.logger.debug("--------------> " + s.nombre_servicio)
        end
      end
      
    @ljuegos = Juego.all()
      if @ljuegos.nil?
        Rails.logger.debug("--------------> esta vacio!... ")
        else
        @ljuegos.each do |j|
          Rails.logger.debug("--------------> " + j.nombre_juego)
        end
      end
    
    render "registrardiacampo"
    
  end

  def cotizardiacampo
  end

  def listapedidos
  end

  def Mantener_ofertas
  end

  def Comentar_ofertas
  end
  
  def mant_resp_familia
  end
  
  def mantener_servicio
  end

  def mjuegos
  end

  def solicitudes
  end

  def vsolicitud
  end
  
  def buscarjuego_get
      @txt_nombre_juego = params[:txt_nombre_juego] 
     
      @juego = Juego.where(['nombre_juego LIKE ?', "%#{@txt_nombre_juego}%"])
      if @juego.nil?
        Rails.logger.debug("--------------> esta vacio!... ")
      else
        @juego.each do |j|
          Rails.logger.debug("--------------> " + j.idjuego.to_s)
          Rails.logger.debug("--------------> " + j.desc_juego.to_s)
          Rails.logger.debug("--------------> " + j.materiales.to_s)
          Rails.logger.debug("--------------> " + j.costo_juego_persona.to_s)
        end
      end 
      render "mjuegos"
  end
  
  
  def guardar_juego
    
    Rails.logger.debug("--------------> Dentro de guardar_juego!!!!!!!!!!!!!!! " )
    
    
    
    
    
    
      render "mjuegos"
  end
  
  
  def eliminar_juego
     @id = params[:id] 
    
     Rails.logger.debug("--------------> Dentro de eliminar_juego!!!!!!!!!!!!!!! " + @id )  
     render "mjuegos"
  end
    
end
