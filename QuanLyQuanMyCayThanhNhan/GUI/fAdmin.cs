﻿using Microsoft.Reporting.Map.WebForms.BingMaps;
using QuanLyQuanMyCayThanhNhan.DAO;
using QuanLyQuanMyCayThanhNhan.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace QuanLyQuanMyCayThanhNhan
{

    public partial class fAdmin : Form
    {
        
        public fAdmin()
        {
            InitializeComponent();
            LoadAll();
        }

        #region MeThod

        BindingSource acountList = new BindingSource();

        public Account loginAccount;

        private void fAdmin_Load_2(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'quanLyQuanMyCayThanhNhanDataSet1.USP_GetListBillByDate' table. You can move, or remove it, as needed.
            this.uSP_GetListBillByDateTableAdapter.Fill(this.quanLyQuanMyCayThanhNhanDataSet1.USP_GetListBillByDate, dtpkFromDate.Value, dtpkToDate.Value);

            this.reportViewer1.RefreshReport();
        }


        void LoadAll()
        {
            dtgvAccount.DataSource = acountList;
            AddAcountBinding();
            LoadAccount();
            LoadDateTimePicker();
            LoadListByDate(dtpkFromDate.Value, dtpkToDate.Value);
        }

        void LoadDateTimePicker()
        {
            DateTime today = DateTime.Now;
            dtpkFromDate.Value = new DateTime(today.Year, today.Month, 1);
            dtpkToDate.Value=dtpkFromDate.Value.AddMonths(1).AddDays(-1);
        }

        void AddAcountBinding()
        {
            txbUserName.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "UserName", true, DataSourceUpdateMode.Never));
            txbDisPlayName.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "DisplayName", true, DataSourceUpdateMode.Never));
            cbRole.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "Role", true, DataSourceUpdateMode.Never));
            txbAddress.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "Address", true, DataSourceUpdateMode.Never));
            txbPhone.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "Phone", true, DataSourceUpdateMode.Never));
            cbGender.DataBindings.Add(new Binding("Text", dtgvAccount.DataSource, "Gender", true, DataSourceUpdateMode.Never));
            
        }
        void LoadAccount()
        {
            acountList.DataSource=AccountDAO.Instance.GetListAccount();
        }

        void AddAcount(string userName, string displayName, string role, string address, string phone, string gender)
        {

            if (AccountDAO.Instance.InsertAccount(userName, displayName, role, address, phone, gender))
            {
                MessageBox.Show("Thêm Thành công");
            }
            else
            {
                MessageBox.Show("Thêm Thất bại\nTrùng tài khoản");
            }
            LoadAccount();
        }

        void EditAcount(string userName, string displayName, string role, string address, string phone, string gender)
        {
            if (AccountDAO.Instance.UpdateAccount(userName, displayName, role, address, phone, gender))
            {
                MessageBox.Show("Sửa Thành công");
            }
            else
            {
                MessageBox.Show("Sửa Thất bại");
            }
            LoadAccount();
        }

        void DeleteAcount(string userName)
        {
            if (loginAccount.UserName.Equals(userName))
            {
                MessageBox.Show("Bạn không thể xóa chính bạn");
                return;
            }

            if (AccountDAO.Instance.DeleteAccount(userName))
            {
                MessageBox.Show("Xóa Thành công");
            }
            else
            {
                MessageBox.Show("Xóa Thất bại");
            }
            LoadAccount();
        }

        void resetpass(string userName)
        {
            if (AccountDAO.Instance.RessetpassAccount(userName))
            {
                MessageBox.Show("Resset mật khẩu Thành công");
            }
            else
            {
                MessageBox.Show("Resset mật khẩu Thất bại");
            }
        }

        void LoadListByDate(DateTime checkIn, DateTime checkOut)
        {
            dtgvBill.DataSource=BillDAO.Instance.GetBillListByDate(checkIn, checkOut);
            int sc = dtgvBill.Rows.Count;
            float tong = 0;
            for (int i = 0; i < sc - 1; i++)
                tong += float.Parse(dtgvBill.Rows[i].Cells["Column2"].Value.ToString());
            label1.Text="Tổng Doanh thu:\r\n"+tong.ToString();
           

        }

        #endregion MeThod


        #region event
        private void btnShowAccount_Click(object sender, EventArgs e)
        {
            LoadAccount();
        }

        private void btnAddAccount_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            string displayName = txbDisPlayName.Text;
            string role = cbRole.Text;
            string address = txbAddress.Text;
            string phone = txbPhone.Text;
            string gender = cbGender.Text;
            AddAcount(userName, displayName, role,address,phone,gender);
        }

        private void btnDeleteAccount_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            DeleteAcount(userName);
        }

        private void btnEditAccount_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            string displayName = txbDisPlayName.Text;
            string role = cbRole.Text;
            string address = txbAddress.Text;
            string phone = txbPhone.Text;
            string gender = cbGender.Text;
            EditAcount(userName, displayName, role, address, phone, gender);
        }

        private void btnResetPassWord_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            resetpass(userName);
        }



        private void btnViewBill_Click(object sender, EventArgs e)
        {
            LoadListByDate(dtpkFromDate.Value, dtpkToDate.Value);
        }

        private void btnFirstBillPage_Click(object sender, EventArgs e)
        {
            txbPageBill.Text="1";
        }

        private void btnLastBillPage_Click(object sender, EventArgs e)
        {
            int sumRecord = BillDAO.Instance.GetNumBillListByDate(dtpkFromDate.Value, dtpkToDate.Value);
            int lastRecord = sumRecord/20;
            if (sumRecord%20!=0)
                lastRecord++;
            txbPageBill.Text=lastRecord.ToString();
        }

        private void txbPageBill_TextChanged(object sender, EventArgs e)
        {
            dtgvBill.DataSource=BillDAO.Instance.GetBillListByDatePage(dtpkFromDate.Value, dtpkToDate.Value, Convert.ToInt32(txbPageBill.Text));
        }

        private void btnPrevioursBillPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(txbPageBill.Text);
            if (page>1)
                page--;
            txbPageBill.Text=page.ToString();
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(txbPageBill.Text);
            int sumRecord = BillDAO.Instance.GetNumBillListByDate(dtpkFromDate.Value, dtpkToDate.Value);

            if (page<sumRecord)
                page++;
            txbPageBill.Text=page.ToString();
        }


        private void cbGender_Click(object sender, EventArgs e)
        {
            List<string> list = new List<string>();
            list.Add("Nam"); list.Add("Nữ");
            cbGender.DataSource = list;
        }

        private void cbRole_Click(object sender, EventArgs e)
        {
            List<string> list = new List<string>();
            list.Add("Quản lý"); list.Add("Nhân viên");
            cbRole.DataSource = list;
        }



        #endregion

        
    }
}
