document.addEventListener("DOMContentLoaded", () => {
  const checkButton = document.getElementById("checkButton");
  const duplicateList = document.getElementById("duplicateList");

  checkButton.addEventListener("click", () => {
    duplicateList.innerHTML = "";

    let questions = JSON.parse(localStorage.getItem("questions") || "[]");

    if (questions.length === 0) {
      duplicateList.innerHTML = "<li>⚠️ Chưa có câu hỏi nào để kiểm tra.</li>";
      return;
    }

    const seen = {};
    const duplicates = [];

    questions.forEach((q) => {
      const normalized = q.text.toLowerCase().replace(/\s+/g, ' ').trim();

      if (seen[normalized]) {
        duplicates.push(q);
      } else {
        seen[normalized] = true;
      }
    });

    if (duplicates.length === 0) {
      duplicateList.innerHTML = "<li>✅ Không phát hiện câu hỏi trùng lặp.</li>";
    } else {
      duplicates.forEach((item, index) => {
        const li = document.createElement("li");
        li.innerHTML = `<strong>${index + 1}.</strong> Câu hỏi trùng: "<em>${item.text}</em>" (CLO: ${item.clo}, Độ khó: ${item.difficulty})`;
        duplicateList.appendChild(li);
      });
    }
  });
});
document.addEventListener("DOMContentLoaded", () => {
  const checkButton = document.getElementById("checkButton");
  const duplicateList = document.getElementById("duplicateList");
  const questionList = document.getElementById("questionList");
  const form = document.getElementById("questionForm");

  // Load & hiển thị danh sách ban đầu
  renderQuestions();

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const text = document.getElementById("text").value.trim();
    const clo = document.getElementById("clo").value.trim();
    const difficulty = document.getElementById("difficulty").value;

    if (!text || !clo || !difficulty) {
      alert("Vui lòng nhập đầy đủ thông tin.");
      return;
    }

    const questions = JSON.parse(localStorage.getItem("questions") || "[]");
    questions.push({ text, clo, difficulty });
    localStorage.setItem("questions", JSON.stringify(questions));
    form.reset();

    renderQuestions();
    alert("✅ Đã thêm câu hỏi.");
  });

  checkButton.addEventListener("click", () => {
    duplicateList.innerHTML = "";
    let questions = JSON.parse(localStorage.getItem("questions") || "[]");

    if (questions.length === 0) {
      duplicateList.innerHTML = "<li>⚠️ Chưa có câu hỏi nào để kiểm tra.</li>";
      return;
    }

    const seen = {};
    const duplicates = [];

    questions.forEach((q) => {
      const normalized = q.text.toLowerCase().replace(/\s+/g, ' ').trim();
      if (seen[normalized]) {
        duplicates.push(q);
      } else {
        seen[normalized] = true;
      }
    });

    if (duplicates.length === 0) {
      duplicateList.innerHTML = "<li>✅ Không phát hiện câu hỏi trùng lặp.</li>";
    } else {
      duplicates.forEach((item, index) => {
        const li = document.createElement("li");
        li.innerHTML = `<strong>${index + 1}.</strong> \"${item.text}\" (CLO: ${item.clo}, Độ khó: ${item.difficulty})`;
        duplicateList.appendChild(li);
      });
    }
  });

  function renderQuestions() {
    const list = JSON.parse(localStorage.getItem("questions") || "[]");
    questionList.innerHTML = "";

    list.forEach((item, index) => {
      const li = document.createElement("li");
      li.innerHTML = `
        ${index + 1}. ${item.text} <em>(${item.clo} - ${item.difficulty})</em>
        <button onclick="deleteQuestion(${index})">🗑️</button>
      `;
      questionList.appendChild(li);
    });
  }

  window.deleteQuestion = function(index) {
    const list = JSON.parse(localStorage.getItem("questions") || "[]");
    list.splice(index, 1);
    localStorage.setItem("questions", JSON.stringify(list));
    renderQuestions();
  };
});
