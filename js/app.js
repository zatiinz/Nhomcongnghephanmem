// app.js
function loadPage(page) {
  const content = document.getElementById("content");
  
  switch(page) {
    case "dashboard-home":
      content.innerHTML = `
        <div class="dashboard-home">
          <h2><i class="fas fa-home"></i> Dashboard Overview</h2>
          <div class="stats-container">
            <div class="stat-card">
              <div class="stat-icon bg-primary">
                <i class="fas fa-book"></i>
              </div>
              <div class="stat-info">
                <h3>Subjects</h3>
                <span id="subjectCount">0</span>
              </div>
            </div>
            <div class="stat-card">
              <div class="stat-icon bg-success">
                <i class="fas fa-question-circle"></i>
              </div>
              <div class="stat-info">
                <h3>Questions</h3>
                <span id="questionCount">0</span>
              </div>
            </div>
            <div class="stat-card">
              <div class="stat-icon bg-warning">
                <i class="fas fa-exclamation-triangle"></i>
              </div>
              <div class="stat-info">
                <h3>Duplicates</h3>
                <span id="duplicateCount">0</span>
              </div>
            </div>
            <div class="stat-card">
              <div class="stat-icon bg-info">
                <i class="fas fa-tasks"></i>
              </div>
              <div class="stat-info">
                <h3>Tasks</h3>
                <span id="taskCount">0</span>
              </div>
            </div>
          </div>
          
          <div class="recent-activity">
            <h3><i class="fas fa-history"></i> Recent Activity</h3>
            <ul id="activityList"></ul>
          </div>
        </div>
      `;
      updateDashboardStats();
      break;
      
    case "create-subject":
      content.innerHTML = `
        <div class="module-container">
          <h2><i class="fas fa-plus-circle"></i> Create New Subject</h2>
          <form id="createSubjectForm" class="form-card">
            <div class="form-group">
              <label for="subjectName">Subject Name</label>
              <input type="text" id="subjectName" name="subjectName" required placeholder="Enter subject name">
            </div>
            
            <div class="form-group">
              <label for="subjectCode">Subject Code</label>
              <input type="text" id="subjectCode" name="subjectCode" required placeholder="Enter subject code">
            </div>
            
            <div class="form-group">
              <label for="cloList">Course Learning Outcomes (CLOs)</label>
              <textarea id="cloList" name="cloList" rows="4" required 
                placeholder="Enter one CLO per line"></textarea>
              <small class="form-text">Enter each CLO on a new line</small>
            </div>
            
            <div class="form-group">
              <label>Difficulty Distribution (%)</label>
              <div class="difficulty-distribution">
                <div class="difficulty-level">
                  <label for="easy">Easy</label>
                  <input type="number" id="easy" name="easy" min="0" max="100" value="30" required>
                </div>
                <div class="difficulty-level">
                  <label for="medium">Medium</label>
                  <input type="number" id="medium" name="medium" min="0" max="100" value="50" required>
                </div>
                <div class="difficulty-level">
                  <label for="hard">Hard</label>
                  <input type="number" id="hard" name="hard" min="0" max="100" value="20" required>
                </div>
              </div>
            </div>
            
            <button type="submit" class="btn btn-primary">
              <i class="fas fa-save"></i> Create Subject
            </button>
          </form>
          <div id="subjectCreateResult" class="result-message"></div>
        </div>
      `;
      setupCreateSubjectForm();
      break;
      
    case "upload-question":
      content.innerHTML = `
        <div class="module-container">
          <h2><i class="fas fa-cloud-upload-alt"></i> Upload New Question</h2>
          
          <div class="upload-container">
            <form id="uploadQuestionForm" class="form-card">
              <div class="form-group">
                <label for="subjectSelect">Select Subject</label>
                <select id="subjectSelect" name="subjectSelect" required>
                  <option value="">-- Select Subject --</option>
                  <!-- Subjects will be loaded from localStorage -->
                </select>
              </div>
              
              <div class="form-group">
                <label for="cloSelect">Select CLO</label>
                <select id="cloSelect" name="cloSelect" required disabled>
                  <option value="">-- Select CLO --</option>
                </select>
              </div>
              
              <div class="form-group">
                <label for="questionText">Question Text (English only)</label>
                <textarea id="questionText" name="questionText" rows="5" required 
                  placeholder="Enter the question text in English..."></textarea>
              </div>
              
              <div class="form-group">
                <label for="difficulty">Difficulty Level</label>
                <select id="difficulty" name="difficulty" required>
                  <option value="">-- Select Difficulty --</option>
                  <option value="Easy">Easy</option>
                  <option value="Medium">Medium</option>
                  <option value="Hard">Hard</option>
                </select>
              </div>
              
              <div class="form-group">
                <label for="questionType">Question Type</label>
                <select id="questionType" name="questionType" required>
                  <option value="">-- Select Type --</option>
                  <option value="Multiple Choice">Multiple Choice</option>
                  <option value="True/False">True/False</option>
                  <option value="Short Answer">Short Answer</option>
                  <option value="Essay">Essay</option>
                </select>
              </div>
              
              <button type="submit" class="btn btn-primary">
                <i class="fas fa-upload"></i> Upload Question
              </button>
            </form>
            
            <div id="uploadResult" class="result-message"></div>
          </div>
        </div>
      `;
      setupUploadQuestionForm();
      break;
      
    case "check-duplicates":
      content.innerHTML = `
        <div class="module-container">
          <h2><i class="fas fa-clone"></i> Check for Duplicate Questions</h2>
          
          <div class="duplicate-check-container">
            <div class="check-options">
              <div class="form-group">
                <label for="checkScope">Check Scope</label>
                <select id="checkScope" name="checkScope">
                  <option value="all">All Questions</option>
                  <option value="subject">Within Selected Subject</option>
                  <option value="recent">Recently Added Questions</option>
                </select>
              </div>
              
              <div class="form-group" id="subjectSelectGroup" style="display: none;">
                <label for="duplicateSubjectSelect">Select Subject</label>
                <select id="duplicateSubjectSelect" name="duplicateSubjectSelect">
                  <option value="">-- Select Subject --</option>
                  <!-- Subjects will be loaded from localStorage -->
                </select>
              </div>
              
              <button id="checkButton" class="btn btn-primary">
                <i class="fas fa-search"></i> Run Duplicate Check
              </button>
            </div>
            
            <div class="results-section">
              <h3><i class="fas fa-poll"></i> Results</h3>
              <div id="duplicateResults">
                <div class="empty-state">
                  <i class="fas fa-search"></i>
                  <p>Run a duplicate check to see results</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      `;
      setupDuplicateCheck();
      break;
      
    case "task-management":
      content.innerHTML = `
        <div class="module-container">
          <h2><i class="fas fa-tasks"></i> Task Management</h2>
          
          <div class="task-management-container">
            <div class="task-form-section">
              <form id="taskForm" class="form-card">
                <div class="form-group">
                  <label for="taskTitle">Task Title</label>
                  <input type="text" id="taskTitle" name="taskTitle" required placeholder="Enter task title">
                </div>
                
                <div class="form-group">
                  <label for="taskDescription">Description</label>
                  <textarea id="taskDescription" name="taskDescription" rows="3" placeholder="Enter task description"></textarea>
                </div>
                
                <div class="form-group">
                  <label for="taskAssignee">Assign To</label>
                  <select id="taskAssignee" name="taskAssignee" required>
                    <option value="">-- Select Assignee --</option>
                    <option value="lecturer1">Lecturer 1</option>
                    <option value="lecturer2">Lecturer 2</option>
                    <option value="subject_leader">Subject Leader</option>
                  </select>
                </div>
                
                <div class="form-group">
                  <label for="taskDeadline">Deadline</label>
                  <input type="date" id="taskDeadline" name="taskDeadline" required>
                </div>
                
                <div class="form-group">
                  <label for="taskPriority">Priority</label>
                  <select id="taskPriority" name="taskPriority" required>
                    <option value="low">Low</option>
                    <option value="medium" selected>Medium</option>
                    <option value="high">High</option>
                  </select>
                </div>
                
                <button type="submit" class="btn btn-primary">
                  <i class="fas fa-plus"></i> Add Task
                </button>
              </form>
            </div>
            
            <div class="task-list-section">
              <div class="task-filters">
                <div class="filter-group">
                  <label for="filterStatus">Status</label>
                  <select id="filterStatus" name="filterStatus">
                    <option value="all">All</option>
                    <option value="pending">Pending</option>
                    <option value="in_progress">In Progress</option>
                    <option value="completed">Completed</option>
                  </select>
                </div>
                
                <div class="filter-group">
                  <label for="filterAssignee">Assignee</label>
                  <select id="filterAssignee" name="filterAssignee">
                    <option value="all">All</option>
                    <option value="me">Assigned to Me</option>
                    <option value="others">Assigned to Others</option>
                  </select>
                </div>
              </div>
              
              <div id="taskList" class="task-list">
                <!-- Tasks will be loaded here -->
              </div>
            </div>
          </div>
        </div>
      `;
      setupTaskManagement();
      break;
  }
}

// Dashboard statistics
function updateDashboardStats() {
  const subjects = JSON.parse(localStorage.getItem("subjects") || "[]");
  const questions = JSON.parse(localStorage.getItem("questions") || "[]");
  const tasks = JSON.parse(localStorage.getItem("tasks") || "[]");
  
  document.getElementById("subjectCount").textContent = subjects.length;
  document.getElementById("questionCount").textContent = questions.length;
  document.getElementById("taskCount").textContent = tasks.length;
  
  // Calculate duplicates (simplified for demo)
  const seen = {};
  let duplicates = 0;
  questions.forEach(q => {
    const normalized = q.text.toLowerCase().replace(/\s+/g, ' ').trim();
    if (seen[normalized]) duplicates++;
    else seen[normalized] = true;
  });
  document.getElementById("duplicateCount").textContent = duplicates;
  
  // Recent activity
  const activityList = document.getElementById("activityList");
  if (activityList) {
    activityList.innerHTML = `
      <li>
        <i class="fas fa-question-circle"></i>
        <span>${questions.length} questions in system</span>
      </li>
      <li>
        <i class="fas fa-book"></i>
        <span>${subjects.length} subjects created</span>
      </li>
      <li>
        <i class="fas fa-bell"></i>
        <span>${duplicates} potential duplicates found</span>
      </li>
    `;
  }
}

// Create Subject Form
function setupCreateSubjectForm() {
  const form = document.getElementById("createSubjectForm");
  const resultDiv = document.getElementById("subjectCreateResult");
  
  if (form) {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      
      const subjectName = form.subjectName.value.trim();
      const subjectCode = form.subjectCode.value.trim();
      const clos = form.cloList.value.trim().split("\n").filter(x => x);
      const easy = parseInt(form.easy.value);
      const medium = parseInt(form.medium.value);
      const hard = parseInt(form.hard.value);
      
      // Validate difficulty percentages
      if (easy + medium + hard !== 100) {
        resultDiv.innerHTML = `<div class="alert alert-danger">Total difficulty percentages must equal 100%</div>`;
        return;
      }
      
      // Create new subject object
      const newSubject = {
        id: Date.now().toString(),
        name: subjectName,
        code: subjectCode,
        clos: clos,
        difficulty: { easy, medium, hard },
        createdAt: new Date().toISOString()
      };
      
      // Save to localStorage
      const subjects = JSON.parse(localStorage.getItem("subjects") || "[]");
      subjects.push(newSubject);
      localStorage.setItem("subjects", JSON.stringify(subjects));
      
      // Show success message
      resultDiv.innerHTML = `
        <div class="alert alert-success">
          <i class="fas fa-check-circle"></i>
          Subject "${subjectName}" created successfully!
        </div>
      `;
      
      // Reset form
      form.reset();
      
      // Update dashboard stats
      updateDashboardStats();
      
      // Add to activity log
      addActivity(`Created new subject: ${subjectName}`);
    });
  }
}

// Upload Question Form
function setupUploadQuestionForm() {
  const form = document.getElementById("uploadQuestionForm");
  const subjectSelect = document.getElementById("subjectSelect");
  const cloSelect = document.getElementById("cloSelect");
  const resultDiv = document.getElementById("uploadResult");
  
  // Load subjects into dropdown
  const subjects = JSON.parse(localStorage.getItem("subjects") || "[]");
  subjectSelect.innerHTML = '<option value="">-- Select Subject --</option>' + 
    subjects.map(sub => 
      `<option value="${sub.id}">${sub.code} - ${sub.name}</option>`
    ).join('');
  
  // Update CLOs when subject changes
  subjectSelect.addEventListener("change", () => {
    const subjectId = subjectSelect.value;
    const subject = subjects.find(s => s.id === subjectId);
    
    cloSelect.innerHTML = '<option value="">-- Select CLO --</option>';
    cloSelect.disabled = !subject;
    
    if (subject) {
      subject.clos.forEach(clo => {
        cloSelect.innerHTML += `<option value="${clo}">${clo}</option>`;
      });
    }
  });
  
  if (form) {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      
      const subjectId = form.subjectSelect.value;
      const clo = form.cloSelect.value;
      const text = form.questionText.value.trim();
      const difficulty = form.difficulty.value;
      const type = form.questionType.value;
      
      if (!subjectId || !clo || !text || !difficulty || !type) {
        resultDiv.innerHTML = `<div class="alert alert-danger">Please fill all required fields</div>`;
        return;
      }
      
      // Get subject name for display
      const subject = subjects.find(s => s.id === subjectId);
      const subjectName = subject ? `${subject.code} - ${subject.name}` : 'Unknown Subject';
      
      // Create new question object
      const newQuestion = {
        id: Date.now().toString(),
        subjectId,
        subjectName,
        clo,
        text,
        difficulty,
        type,
        createdAt: new Date().toISOString(),
        createdBy: localStorage.getItem("currentUser") || "Unknown"
      };
      
      // Save to localStorage
      const questions = JSON.parse(localStorage.getItem("questions") || "[]");
      questions.push(newQuestion);
      localStorage.setItem("questions", JSON.stringify(questions));
      
      // Show success message
      resultDiv.innerHTML = `
        <div class="alert alert-success">
          <i class="fas fa-check-circle"></i>
          Question uploaded successfully to ${subjectName}!
        </div>
      `;
      
      // Reset form
      form.reset();
      cloSelect.disabled = true;
      
      // Update dashboard stats
      updateDashboardStats();
      
      // Add to activity log
      addActivity(`Uploaded new question to ${subjectName}`);
    });
  }
}

// Duplicate Check Functionality
function setupDuplicateCheck() {
  const checkButton = document.getElementById("checkButton");
  const checkScope = document.getElementById("checkScope");
  const subjectSelectGroup = document.getElementById("subjectSelectGroup");
  const duplicateSubjectSelect = document.getElementById("duplicateSubjectSelect");
  const resultsDiv = document.getElementById("duplicateResults");
  
  // Load subjects into dropdown
  const subjects = JSON.parse(localStorage.getItem("subjects") || "[]");
  duplicateSubjectSelect.innerHTML = '<option value="">-- Select Subject --</option>' + 
    subjects.map(sub => 
      `<option value="${sub.id}">${sub.code} - ${sub.name}</option>`
    ).join('');
  
  // Show/hide subject selector based on scope
  checkScope.addEventListener("change", () => {
    subjectSelectGroup.style.display = 
      checkScope.value === "subject" ? "block" : "none";
  });
  
  if (checkButton) {
    checkButton.addEventListener("click", () => {
      const scope = checkScope.value;
      const subjectId = duplicateSubjectSelect.value;
      
      let questions = JSON.parse(localStorage.getItem("questions") || "[]");
      
      // Filter questions based on scope
      if (scope === "subject" && subjectId) {
        questions = questions.filter(q => q.subjectId === subjectId);
      } else if (scope === "recent") {
        // Get questions from last 7 days
        const oneWeekAgo = new Date();
        oneWeekAgo.setDate(oneWeekAgo.getDate() - 7);
        questions = questions.filter(q => new Date(q.createdAt) > oneWeekAgo);
      }
      
      if (questions.length === 0) {
        resultsDiv.innerHTML = `
          <div class="empty-state">
            <i class="fas fa-info-circle"></i>
            <p>No questions found for the selected scope</p>
          </div>
        `;
        return;
      }
      
      // Check for duplicates
      const seen = {};
      const duplicates = [];
      
      questions.forEach(q => {
        const normalized = q.text.toLowerCase()
          .replace(/\s+/g, ' ')
          .replace(/[^\w\s]/g, '')
          .trim();
        
        if (seen[normalized]) {
          duplicates.push({...q, duplicateOf: seen[normalized]});
        } else {
          seen[normalized] = q.id;
        }
      });
      
      // Display results
      if (duplicates.length === 0) {
        resultsDiv.innerHTML = `
          <div class="alert alert-success">
            <i class="fas fa-check-circle"></i>
            No duplicate questions found!
          </div>
        `;
      } else {
        let resultsHTML = `
          <div class="alert alert-warning">
            <i class="fas fa-exclamation-triangle"></i>
            Found ${duplicates.length} potential duplicate(s)
          </div>
          <div class="duplicates-list">
            <h4>Duplicate Questions:</h4>
            <table class="duplicates-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Question</th>
                  <th>Subject</th>
                  <th>CLO</th>
                  <th>Difficulty</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
        `;
        
        duplicates.forEach((dup, index) => {
          resultsHTML += `
            <tr>
              <td>${index + 1}</td>
              <td>${dup.text}</td>
              <td>${dup.subjectName}</td>
              <td>${dup.clo}</td>
              <td>${dup.difficulty}</td>
              <td>
                <button class="btn btn-sm btn-danger" onclick="deleteQuestion('${dup.id}')">
                  <i class="fas fa-trash"></i> Delete
                </button>
              </td>
            </tr>
          `;
        });
        
        resultsHTML += `
              </tbody>
            </table>
          </div>
        `;
        
        resultsDiv.innerHTML = resultsHTML;
      }
      
      // Add to activity log
      addActivity(`Ran duplicate check (${scope} scope), found ${duplicates.length} duplicates`);
    });
  }
}

// Task Management
function setupTaskManagement() {
  const taskForm = document.getElementById("taskForm");
  const taskList = document.getElementById("taskList");
  const filterStatus = document.getElementById("filterStatus");
  const filterAssignee = document.getElementById("filterAssignee");
  
  // Load and render tasks
  function renderTasks() {
    const tasks = JSON.parse(localStorage.getItem("tasks") || "[]");
    const statusFilter = filterStatus.value;
    const assigneeFilter = filterAssignee.value;
    const currentUser = localStorage.getItem("currentUser") || "";
    
    let filteredTasks = tasks;
    
    // Apply filters
    if (statusFilter !== "all") {
      filteredTasks = filteredTasks.filter(t => t.status === statusFilter);
    }
    
    if (assigneeFilter === "me") {
      filteredTasks = filteredTasks.filter(t => t.assignee === currentUser);
    } else if (assigneeFilter === "others") {
      filteredTasks = filteredTasks.filter(t => t.assignee !== currentUser);
    }
    
    // Render tasks
    if (filteredTasks.length === 0) {
      taskList.innerHTML = `
        <div class="empty-state">
          <i class="fas fa-tasks"></i>
          <p>No tasks found matching your filters</p>
        </div>
      `;
    } else {
      taskList.innerHTML = filteredTasks.map(task => `
        <div class="task-card ${task.status} ${task.priority}">
          <div class="task-header">
            <h4>${task.title}</h4>
            <span class="task-priority">${task.priority}</span>
          </div>
          <div class="task-body">
            <p>${task.description || 'No description'}</p>
            <div class="task-meta">
              <span><i class="fas fa-user"></i> ${task.assignee}</span>
              <span><i class="fas fa-calendar-alt"></i> ${new Date(task.deadline).toLocaleDateString()}</span>
              <span class="task-status">${task.status.replace('_', ' ')}</span>
            </div>
          </div>
          <div class="task-actions">
            <button class="btn btn-sm btn-primary" onclick="updateTaskStatus('${task.id}', 'in_progress')">
              <i class="fas fa-play"></i> Start
            </button>
            <button class="btn btn-sm btn-success" onclick="updateTaskStatus('${task.id}', 'completed')">
              <i class="fas fa-check"></i> Complete
            </button>
            <button class="btn btn-sm btn-danger" onclick="deleteTask('${task.id}')">
              <i class="fas fa-trash"></i> Delete
            </button>
          </div>
        </div>
      `).join('');
    }
  }
  
  // Task form submission
  if (taskForm) {
    taskForm.addEventListener("submit", (e) => {
      e.preventDefault();
      
      const newTask = {
        id: Date.now().toString(),
        title: taskForm.taskTitle.value.trim(),
        description: taskForm.taskDescription.value.trim(),
        assignee: taskForm.taskAssignee.value,
        deadline: taskForm.taskDeadline.value,
        priority: taskForm.taskPriority.value,
        status: "pending",
        createdAt: new Date().toISOString(),
        createdBy: localStorage.getItem("currentUser") || "Unknown"
      };
      
      // Save to localStorage
      const tasks = JSON.parse(localStorage.getItem("tasks") || "[]");
      tasks.push(newTask);
      localStorage.setItem("tasks", JSON.stringify(tasks));
      
      // Reset form
      taskForm.reset();
      
      // Re-render tasks
      renderTasks();
      
      // Update dashboard stats
      updateDashboardStats();
      
      // Add to activity log
      addActivity(`Created new task: ${newTask.title}`);
    });
  }
  
  // Filter changes
  filterStatus.addEventListener("change", renderTasks);
  filterAssignee.addEventListener("change", renderTasks);
  
  // Initial render
  renderTasks();
}

// Global functions
window.deleteQuestion = function(questionId) {
  let questions = JSON.parse(localStorage.getItem("questions") || "[]");
  questions = questions.filter(q => q.id !== questionId);
  localStorage.setItem("questions", JSON.stringify(questions));
  
  // Refresh the duplicate check results
  if (document.getElementById("duplicateResults")) {
    document.getElementById("checkButton").click();
  }
  
  // Update dashboard stats
  updateDashboardStats();
  
  // Add to activity log
  addActivity(`Deleted question ID: ${questionId}`);
};

window.updateTaskStatus = function(taskId, newStatus) {
  let tasks = JSON.parse(localStorage.getItem("tasks") || "[]");
  const taskIndex = tasks.findIndex(t => t.id === taskId);
  
  if (taskIndex !== -1) {
    tasks[taskIndex].status = newStatus;
    localStorage.setItem("tasks", JSON.stringify(tasks));
    
    // Re-render tasks
    if (document.getElementById("taskList")) {
      setupTaskManagement();
    }
    
    // Add to activity log
    addActivity(`Updated task ${taskId} to ${newStatus}`);
  }
};

window.deleteTask = function(taskId) {
  let tasks = JSON.parse(localStorage.getItem("tasks") || "[]");
  tasks = tasks.filter(t => t.id !== taskId);
  localStorage.setItem("tasks", JSON.stringify(tasks));
  
  // Re-render tasks
  if (document.getElementById("taskList")) {
    setupTaskManagement();
  }
  
  // Update dashboard stats
  updateDashboardStats();
  
  // Add to activity log
  addActivity(`Deleted task ID: ${taskId}`);
};

function addActivity(message) {
  const activities = JSON.parse(localStorage.getItem("activities") || "[]");
  activities.unshift({
    message,
    timestamp: new Date().toISOString(),
    user: localStorage.getItem("currentUser") || "System"
  });
  
  // Keep only last 50 activities
  if (activities.length > 50) activities.pop();
  
  localStorage.setItem("activities", JSON.stringify(activities));
}