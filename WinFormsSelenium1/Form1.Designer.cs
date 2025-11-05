namespace WinFormsSelenium1
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            btnLogin = new Button();
            tabControl1 = new TabControl();
            tabPage1 = new TabPage();
            btnLogout = new Button();
            txtPassword = new TextBox();
            label3 = new Label();
            txtUsername = new TextBox();
            label2 = new Label();
            tabPage2 = new TabPage();
            btnAutoInputProspek = new Button();
            label1 = new Label();
            txtBaseAddress = new TextBox();
            gvLogs = new DataGridView();
            tabControl1.SuspendLayout();
            tabPage1.SuspendLayout();
            tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gvLogs).BeginInit();
            SuspendLayout();
            // 
            // btnLogin
            // 
            btnLogin.Location = new Point(23, 121);
            btnLogin.Name = "btnLogin";
            btnLogin.Size = new Size(193, 57);
            btnLogin.TabIndex = 0;
            btnLogin.Text = "LOGIN";
            btnLogin.UseVisualStyleBackColor = true;
            btnLogin.Click += button1_Click;
            // 
            // tabControl1
            // 
            tabControl1.Controls.Add(tabPage1);
            tabControl1.Controls.Add(tabPage2);
            tabControl1.Dock = DockStyle.Bottom;
            tabControl1.Location = new Point(0, 62);
            tabControl1.Name = "tabControl1";
            tabControl1.SelectedIndex = 0;
            tabControl1.Size = new Size(1012, 300);
            tabControl1.TabIndex = 1;
            // 
            // tabPage1
            // 
            tabPage1.Controls.Add(btnLogout);
            tabPage1.Controls.Add(txtPassword);
            tabPage1.Controls.Add(label3);
            tabPage1.Controls.Add(txtUsername);
            tabPage1.Controls.Add(label2);
            tabPage1.Controls.Add(btnLogin);
            tabPage1.Location = new Point(4, 24);
            tabPage1.Name = "tabPage1";
            tabPage1.Padding = new Padding(3);
            tabPage1.Size = new Size(1004, 272);
            tabPage1.TabIndex = 0;
            tabPage1.Text = "Winform LOGIN";
            tabPage1.UseVisualStyleBackColor = true;
            // 
            // btnLogout
            // 
            btnLogout.Location = new Point(239, 121);
            btnLogout.Name = "btnLogout";
            btnLogout.Size = new Size(193, 57);
            btnLogout.TabIndex = 5;
            btnLogout.Text = "LOGOUT";
            btnLogout.UseVisualStyleBackColor = true;
            btnLogout.Click += btnLogout_Click;
            // 
            // txtPassword
            // 
            txtPassword.Location = new Point(140, 67);
            txtPassword.Name = "txtPassword";
            txtPassword.Size = new Size(185, 23);
            txtPassword.TabIndex = 4;
            txtPassword.Text = "user";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(24, 70);
            label3.Name = "label3";
            label3.Size = new Size(90, 15);
            label3.TabIndex = 3;
            label3.Text = "Login Password";
            // 
            // txtUsername
            // 
            txtUsername.Location = new Point(140, 28);
            txtUsername.Name = "txtUsername";
            txtUsername.Size = new Size(185, 23);
            txtUsername.TabIndex = 2;
            txtUsername.Text = "user";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(24, 31);
            label2.Name = "label2";
            label2.Size = new Size(93, 15);
            label2.TabIndex = 1;
            label2.Text = "Login Username";
            // 
            // tabPage2
            // 
            tabPage2.Controls.Add(btnAutoInputProspek);
            tabPage2.Location = new Point(4, 24);
            tabPage2.Name = "tabPage2";
            tabPage2.Padding = new Padding(3);
            tabPage2.Size = new Size(1004, 272);
            tabPage2.TabIndex = 1;
            tabPage2.Text = "Wnform FORM PROSPEK";
            tabPage2.UseVisualStyleBackColor = true;
            // 
            // btnAutoInputProspek
            // 
            btnAutoInputProspek.Location = new Point(23, 38);
            btnAutoInputProspek.Name = "btnAutoInputProspek";
            btnAutoInputProspek.Size = new Size(178, 41);
            btnAutoInputProspek.TabIndex = 0;
            btnAutoInputProspek.Text = "Auto Input";
            btnAutoInputProspek.UseVisualStyleBackColor = true;
            btnAutoInputProspek.Click += btnAutoInputProspek_Click;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(27, 21);
            label1.Name = "label1";
            label1.Size = new Size(94, 15);
            label1.TabIndex = 2;
            label1.Text = "Website Address";
            // 
            // txtBaseAddress
            // 
            txtBaseAddress.Location = new Point(144, 18);
            txtBaseAddress.Name = "txtBaseAddress";
            txtBaseAddress.Size = new Size(340, 23);
            txtBaseAddress.TabIndex = 3;
            txtBaseAddress.Text = "https://localhost:7138/";
            // 
            // gvLogs
            // 
            gvLogs.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;
            gvLogs.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            gvLogs.Dock = DockStyle.Bottom;
            gvLogs.EditMode = DataGridViewEditMode.EditProgrammatically;
            gvLogs.Location = new Point(0, 362);
            gvLogs.Name = "gvLogs";
            gvLogs.ReadOnly = true;
            gvLogs.Size = new Size(1012, 259);
            gvLogs.TabIndex = 4;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1012, 621);
            Controls.Add(tabControl1);
            Controls.Add(gvLogs);
            Controls.Add(txtBaseAddress);
            Controls.Add(label1);
            Name = "Form1";
            Text = "Selenium Web Form";
            Load += Form1_Load;
            tabControl1.ResumeLayout(false);
            tabPage1.ResumeLayout(false);
            tabPage1.PerformLayout();
            tabPage2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gvLogs).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button btnLogin;
        private TabControl tabControl1;
        private TabPage tabPage1;
        private TabPage tabPage2;
        private TextBox txtPassword;
        private Label label3;
        private TextBox txtUsername;
        private Label label2;
        private Label label1;
        private TextBox txtBaseAddress;
        private Button btnLogout;
        private Button btnAutoInputProspek;
        private DataGridView gvLogs;
    }
}
