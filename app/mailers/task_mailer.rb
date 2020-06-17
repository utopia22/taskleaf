class TaskMailer < ApplicationMailer
  default from: 'taskleaf@example.com'
  def create_mail(task)
    @task = task
    mail(
       subtitle: 'タスク作成完了メール'
       to: 'user@example.com',
       from: 'taskleaf@example.com'
    )
  end
end
