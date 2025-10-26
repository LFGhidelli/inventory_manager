# Inventory Management System 🏪

The **Inventory Management System** is a web application built with Ruby on Rails that allows users to manage brands, suppliers, categories, products, and stock movements (entries and sales), as well as track inventory and business metrics from a dashboard with charts and statistics.

---

## ✅ Features

- ✅ Manage **brands**, **suppliers**, **categories**, and **products**
- ✅ Track **stock entries** and **stock withdrawals (sales)**
- ✅ **Dashboard** with KPIs and **interactive charts** using Chart.js
- ✅ **Inventory value, stock cost, sales revenue, and profit calculations**
- ✅ **AI-generated brand description** (via Groq API) if left blank
- ✅ **Authentication required** to access the system
- ✅ Responsive UI using **Bootstrap**

---

## 🛠️ Tech Stack

| Technology        | Description |
|-------------------|-------------|
| Ruby on Rails     | Backend framework |
| PostgreSQL        | Relational database |
| Bootstrap         | Responsive UI styling |
| Chart.js          | Interactive dashboard charts |
| Importmap         | JavaScript bundling |
| Groq AI API       | Generates brand descriptions automatically |

---

## 🚀 Getting Started

### ✅ Prerequisites

Before you begin, make sure you have:

- Ruby 3.x
- Rails 7.x
- PostgreSQL installed and running
- Bundler installed

---

### 🔧 Installation

```bash
# Clone the repository
git clone https://github.com/your-username/your-repo.git
cd your-repo

# Install dependencies
bundle install

# Setup database
rails db:create db:migrate

# Start the server
rails s
