
class ImageUploader
    def initialize(foobar, params)
        @foobar = foobar
        @params = params
    end

    def call
        if @params[:image] && !file?(@params[:image])
            delete_image if @foobar.image.attached?
            @params.delete(:image)
        end
        puts "updating the parameters"
        @foobar.update(@params)
    end

    private
    def file?(param)
        param.is_a?(ActionDispatch::Http::UploadedFile)
    end

    def delete_image
        @foobar.image.purge
    end
end
