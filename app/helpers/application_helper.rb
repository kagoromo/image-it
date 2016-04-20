module ApplicationHelper
    def full_title(page_title='')
        base_title='一GO!'
        if page_title.empty?
            base_title
        else
            page_title+" | "+base_title
        end
    end
    
    def user_name(user)
        base_name='Anonymous'
        if user.name.empty?
            base_name+" "+user.id.to_s
        else
            user.name
        end
    end
    
    def user_page_button(user)
        base_name=user_name(user)
        if user.name.length>14
            base_name[0..13]+"..."
        else
            base_name
        end
    end
    
    def check_owner(id=0)
        id == current_user.id
    end
    
    def check_current_page
        request.url[-4..-1]=='edit'
    end
    
    def check_header
        request.path[-17..-1]=='show_user_gallery'||request.path[-18..-1]=='show_user_bookmark'
    end
    
    def alert_type(message)
        case message.to_s
            when "notice"
                "success"
            when "alert"
                "warning"
            when "error"
                "danger"
            else
                "info"
        end
    end
    
    def comment_info(comment)
        ", editted at #{comment.updated_at}" unless comment.created_at == comment.updated_at
    end
    
end
