import SwiftUI

struct TaskListView: View {
    var username: String

    @State private var tasks: [Task] = [
        Task(title: "Train Haki skills", description: "You must be stronger"),
        Task(title: "Work out", description: "Let's pump some muscles"),
        Task(title: "Reading", description: "Study the Glyphs")
    ]

    @State private var showingAddTask = false
    @State private var newTaskTitle = ""
    @State private var newTaskDescription = ""

    var body: some View {
        VStack {
            Text("Task List")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .fontWeight(.bold)
                .padding(.top)

            List {
                ForEach($tasks) { $task in
                    TaskRow(task: $task)
                }
                .onDelete(perform: deleteTasks)
            }

            Button(action: {
                showingAddTask = true
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Task")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.purple)
                .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .navigationTitle("\(username)'s Tasks")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingAddTask) {
            VStack(spacing: 20) {
                Text("New Task")
                    .font(.title)
                    .fontWeight(.bold)

                TextField("Title", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                TextField("Description", text: $newTaskDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    let newTask = Task(title: newTaskTitle, description: newTaskDescription)
                    tasks.append(newTask)
                    newTaskTitle = ""
                    newTaskDescription = ""
                    showingAddTask = false
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .disabled(newTaskTitle.isEmpty)

                Spacer()
            }
            .padding(.top, 30)
        }
    }

    func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct TaskRow: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            Button(action: {
                task.isCompleted.toggle()
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }

            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(task.isCompleted ? .gray : .primary)
                    .strikethrough(task.isCompleted)

                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    TaskListView(username: "User")
}
