class ImageUploadService
    def initialze(customer, params)
        @customer = customer
        @params = params
    end

    def call
        if @params[:image] && !file?(@params[:image])
            delete_image if @customer.image.attached?
            @params.delete(:image)
        end

        @customer.update(@params)
    end

    private
    def file?(param)
        param.is_a?(ActionDispatch::Http::UploadedFile)
    end

    def delete_image
        @customer.image.purge
    end
end
