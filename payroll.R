
set.seed(123)

generate_workers <- function(n=400){
  workers <- data.frame(
    id = 1:n,
    name = paste0("Worker_", 1:n),
    gender = sample(c("Male","Female"), n, replace=TRUE),
    salary = sample(5000:35000, n, replace=TRUE),
    stringsAsFactors = FALSE
  )
  return(workers)
}

generate_payment_slips <- function(workers){
  tryCatch({
    
    for(i in 1:nrow(workers)){
      
      salary <- workers$salary[i]
      gender <- workers$gender[i]
      level <- "Unassigned"
      
      if(salary > 10000 && salary < 20000){
        level <- "A1"
      }
      
      if(salary > 7500 && salary < 30000 && gender == "Female"){
        level <- "A5-F"
      }
      
      cat("------ PAYMENT SLIP ------\n")
      cat("Worker ID:", workers$id[i], "\n")
      cat("Name:", workers$name[i], "\n")
      cat("Gender:", gender, "\n")
      cat("Salary: $", salary, "\n")
      cat("Employee Level:", level, "\n")
      cat("--------------------------\n\n")
    }
    
  }, error=function(e){
    cat("Error occurred:", e$message)
  })
}

workers <- generate_workers(400)
generate_payment_slips(workers)
