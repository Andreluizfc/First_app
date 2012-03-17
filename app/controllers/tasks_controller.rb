class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = Task.all
    @task = Task.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml

  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml

  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit

  def edit
    @task = Task.find(params[:id]) 
  end

  # POST /tasks
  # POST /tasks.xml

  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      @task.status = "undone"
      if @task.save
        format.html { redirect_to(tasks_url) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml

  def update
    @task = Task.find(params[:id])
 
    respond_to do |format|
      @task.status = "done"
      if @task.update_attributes(params[:task])
         
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end

  def delete_selected
    i = 0
    arr_item = Array.new
    @tasks = Task.find(params[:task_ids])
    @tasks.each do |task|
     task.destroy 
     arr_item[i] = task.name
     i += 1
    end
    @task_name = arr_item*', '
      
       redirect_to(tasks_url)
 
  end
  
  def mark_as_done
    i = 0
    arr_item = Array.new
    @tasks = Task.find(params[:task_ids])
    @tasks.each do |task|
     task.name = task.name+" (Done)"
     task.status = "done"
     task.update_attributes(params[:task]) 
     arr_item[i] = task.name
     i += 1
    end
    @task_name = arr_item*', '  
 
    redirect_to(tasks_url)  
  end

  def form_action  
      case params[:commit]
         when "Mark selected as done": mark_as_done
         when "Delete selected": delete_selected 
      end  
  end


end
