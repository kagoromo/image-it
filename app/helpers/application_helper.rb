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
        if user.name.length>12
            base_name[0..11]
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
    
end
