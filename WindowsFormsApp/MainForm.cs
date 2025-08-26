using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class MainForm : Form
    {
        private string connectionString;

        // Объявляем все элементы управления
        private DataGridView dataGridViewEmployees;
        private DataGridView dataGridViewStat;
        private ComboBox comboBoxStatus;
        private ComboBox comboBoxDep;
        private ComboBox comboBoxPost;
        private ComboBox comboBoxStatStatus;
        private TextBox textBoxLastName;
        private DateTimePicker dateTimePickerStart;
        private DateTimePicker dateTimePickerEnd;
        private RadioButton radioButtonEmployed;
        private RadioButton radioButtonDismissed;
        private Button buttonApplyFilter;
        private Button buttonShowStat;

        public MainForm()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            LoadComboBoxes();
            LoadEmployees();
        }

        private void InitializeComponent()
        {
            // Настраиваем саму форму
            this.Text = "Управление сотрудниками";
            this.Size = new Size(1000, 700);
            this.StartPosition = FormStartPosition.CenterScreen;

            // ComboBox для фильтра по статусу
            comboBoxStatus = new ComboBox();
            comboBoxStatus.Location = new Point(10, 10);
            comboBoxStatus.Size = new Size(150, 21);
            this.Controls.Add(comboBoxStatus);

            // ComboBox для фильтра по отделу
            comboBoxDep = new ComboBox();
            comboBoxDep.Location = new Point(170, 10);
            comboBoxDep.Size = new Size(150, 21);
            this.Controls.Add(comboBoxDep);

            // ComboBox для фильтра по должности
            comboBoxPost = new ComboBox();
            comboBoxPost.Location = new Point(330, 10);
            comboBoxPost.Size = new Size(150, 21);
            this.Controls.Add(comboBoxPost);

            // TextBox для фильтра по фамилии
            textBoxLastName = new TextBox();
            textBoxLastName.Location = new Point(490, 10);
            textBoxLastName.Size = new Size(150, 20);
            this.Controls.Add(textBoxLastName);

            // Кнопка применения фильтра
            buttonApplyFilter = new Button();
            buttonApplyFilter.Location = new Point(650, 10);
            buttonApplyFilter.Size = new Size(100, 23);
            buttonApplyFilter.Text = "Применить фильтр";
            buttonApplyFilter.Click += buttonApplyFilter_Click;
            this.Controls.Add(buttonApplyFilter);

            // DataGridView для отображения сотрудников
            dataGridViewEmployees = new DataGridView();
            dataGridViewEmployees.Location = new Point(10, 40);
            dataGridViewEmployees.Size = new Size(960, 200);
            this.Controls.Add(dataGridViewEmployees);

            // ComboBox для выбора статуса в статистике
            comboBoxStatStatus = new ComboBox();
            comboBoxStatStatus.Location = new Point(10, 250);
            comboBoxStatStatus.Size = new Size(150, 21);
            this.Controls.Add(comboBoxStatStatus);

            // DateTimePicker для начала периода
            dateTimePickerStart = new DateTimePicker();
            dateTimePickerStart.Location = new Point(170, 250);
            dateTimePickerStart.Size = new Size(150, 20);
            this.Controls.Add(dateTimePickerStart);

            // DateTimePicker для конца периода
            dateTimePickerEnd = new DateTimePicker();
            dateTimePickerEnd.Location = new Point(330, 250);
            dateTimePickerEnd.Size = new Size(150, 20);
            this.Controls.Add(dateTimePickerEnd);

            // RadioButton для принятых
            radioButtonEmployed = new RadioButton();
            radioButtonEmployed.Location = new Point(490, 250);
            radioButtonEmployed.Size = new Size(100, 17);
            radioButtonEmployed.Text = "Принятые";
            radioButtonEmployed.Checked = true;
            this.Controls.Add(radioButtonEmployed);

            // RadioButton для уволенных
            radioButtonDismissed = new RadioButton();
            radioButtonDismissed.Location = new Point(590, 250);
            radioButtonDismissed.Size = new Size(100, 17);
            radioButtonDismissed.Text = "Уволенные";
            this.Controls.Add(radioButtonDismissed);

            // Кнопка показа статистики
            buttonShowStat = new Button();
            buttonShowStat.Location = new Point(700, 250);
            buttonShowStat.Size = new Size(100, 23);
            buttonShowStat.Text = "Показать статистику";
            buttonShowStat.Click += buttonShowStat_Click;
            this.Controls.Add(buttonShowStat);

            // DataGridView для отображения статистики
            dataGridViewStat = new DataGridView();
            dataGridViewStat.Location = new Point(10, 280);
            dataGridViewStat.Size = new Size(960, 200);
            this.Controls.Add(dataGridViewStat);
        }

        private void LoadComboBoxes()
        {
            LoadComboBox("GetStatuses", comboBoxStatus);
            LoadComboBox("GetDeps", comboBoxDep);
            LoadComboBox("GetPosts", comboBoxPost);
            LoadComboBox("GetStatuses", comboBoxStatStatus);
        }

        private void LoadComboBox(string procedureName, ComboBox comboBox)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(procedureName, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                DataTable table = new DataTable();
                table.Load(cmd.ExecuteReader());
                comboBox.DataSource = table;
                comboBox.DisplayMember = "name";
                comboBox.ValueMember = "id";
            }
        }

        private void LoadEmployees()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetEmployees", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (comboBoxStatus.SelectedValue != null)
                    cmd.Parameters.AddWithValue("@StatusId", comboBoxStatus.SelectedValue);
                if (comboBoxDep.SelectedValue != null)
                    cmd.Parameters.AddWithValue("@DepId", comboBoxDep.SelectedValue);
                if (comboBoxPost.SelectedValue != null)
                    cmd.Parameters.AddWithValue("@PostId", comboBoxPost.SelectedValue);
                if (!string.IsNullOrEmpty(textBoxLastName.Text))
                    cmd.Parameters.AddWithValue("@LastNamePart", textBoxLastName.Text);

                conn.Open();
                DataTable table = new DataTable();
                table.Load(cmd.ExecuteReader());
                dataGridViewEmployees.DataSource = table;
            }
        }

        private void buttonApplyFilter_Click(object sender, EventArgs e)
        {
            LoadEmployees();
        }

        private void buttonShowStat_Click(object sender, EventArgs e)
        {
            if (comboBoxStatStatus.SelectedValue == null)
            {
                MessageBox.Show("Выберите статус");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetStatistics", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StatusId", comboBoxStatStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@StartDate", dateTimePickerStart.Value);
                cmd.Parameters.AddWithValue("@EndDate", dateTimePickerEnd.Value);
                cmd.Parameters.AddWithValue("@Type", radioButtonEmployed.Checked ? 0 : 1);

                conn.Open();
                DataTable table = new DataTable();
                table.Load(cmd.ExecuteReader());
                dataGridViewStat.DataSource = table;
            }
        }
    }
}
