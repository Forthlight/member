require_dependency "member/application_controller"

module Member
  class PublicationsController < ApplicationController
    def index
      @publications = Article::Publication.where(author: current_user.id)
    end

    def show
      @publication = Article::Publication.where(author: current_user.id).find(params[:id])
    end

    def new
      @publication = Article::Publication.new
    end

    def create
      @publication = Article::Publication.new(publication_params)
      @publication.author = current_user.id

      if @publication.save
        redirect_to member.publications_path, :notice => "An article was created"
      else
        render action: :new, :notice => "An error occured, the article was not created"
      end
    end

    def edit
      @publication = Article::Publication.where(author: current_user.id).find(params[:id])
    end

    def update
      @publication = Article::Publication.where(author: current_user.id).find(params[:id])

      if @publication.update_attributes(publication_params)
        redirect_to member.publications_path, notice: 'Successfully updated'
      else
        render action: :edit, :notice => "An error occured, the article was not updated"
      end
    end

    def destroy
      def destroy
        @publication = Article::Publication.where(author: current_user.id).find(params[:id])
      
        unless @publication.destroy
          redirect_to(member.publications_path, notice: "An error occured, the deletion was not successful")
        else
          redirect_to(member.publications_path, notice: "An article was deleted")
        end
      end
    end

    private

    def publication_params
      params.require(:publication).permit(:title, :content, :published, :type_id, :category_id)
    end
  end
end
