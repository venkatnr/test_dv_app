class TaskMailer < ActionMailer::Base
  default from: "redmine.logicmatter@gmail.com"
def task_creation(usermail,iname,tid)
@user = usermail
@user_id = iname
@task_id = tid
@task = Task.find(:all , :conditions => {:id => @task_name })

    mail(:to =>@user, :subject => "Task", :from => "redmine.logicmatter@gmail.com")
  end

def task_update(usermail,tid,week)
@task_acceptor = usermail
@task = tid
@week = week
@task = Task.find(:all , :conditions => {:id => @task })
@tasks = Task.find(:all)

    mail(:to =>@task_acceptor.mail, :subject => "Task", :from => "redmine.logicmatter@gmail.com")
  end  
def weekly_mail(user)
@user = user
@user_mail = User.find(@user)
@today = Date.today
@tasks = Task.find(:all, :conditions => {:acceptor => @user_mail.lastname })

mail(:to =>@user_mail.mail, :subject => "Task", :from => "redmine.logicmatter@gmail.com")
end

end
