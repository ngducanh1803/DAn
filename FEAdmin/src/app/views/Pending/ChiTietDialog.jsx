import { Modal, Table } from "antd";
import React, { useEffect, useState } from "react";
import "./Pending.css"
import moment from "moment";
import { getTourId, getChiTourById } from "./PendingService"

const detailBoxStyle = {
    color: '#DB162F',
    fontSize: 23
}

const ChiTietDialog = (props) => {

    const { isModalOpen, handleCancel, id } = props

    const [tourDetail, setTourDetail] = useState({});
    const [Chitour, setChiTour] = useState({});

    const getTourDetail = async () => {
        const res = await getTourId(id)
        // console.log("==> resTourDetail: ", res.data)
        setTourDetail(res.data)
    }

    const getChiTour = async () => {
        const res = await getChiTourById(id)
        // console.log("==> res:", res.data)
        setChiTour(res.data)
    }

    const setData = async () => {
        await getTourDetail()
        await getChiTour()
    }

    useEffect(() => {

        setData()

    }, []);

    console.log("==> tourdetail: ", tourDetail)
    console.log("==> chitour: ", Chitour)

    return (
        <Modal
            className="ant-modal-content"
            style={{ marginTop: -100 }}
            // title="Basic Modal"
            open={isModalOpen}
            // onOk={handleOk}
            onCancel={handleCancel}
            width={1200}
            footer={null}
        >
            <div className="strollhny-blog-grids row">
                <div className="col-lg-8 blog-left-view">
                    <div className="blog-posthny-info">
                        <div className="single-post-image mb-4">
                            <div className="post-content">
                                <span className="sub-title">Travel</span>
                                <h4 className="text-head-text-9 my-2">
                                    {tourDetail.tenTour}
                                </h4>
                            </div>
                            <ul className="blog-author-date d-flex align-items-center mb-4">

                                <li>By <a href="#URL">Admin</a></li>
                                <li>Mar 18, 2020</li>
                            </ul>
                            <div className="single-page-img">
                                <img style={{ height: 416, width: 768 }} src={Chitour.hinhAnh && `http://127.0.0.1:8887/${Chitour.hinhAnh}`} className="img img-fluid" alt="" />
                            </div>


                        </div>

                        <div className="single-post-content">
                            <h4 className="side-title ">Lịch trình Tour</h4>

                            <div>
                                <div style={{ display: "flex" }}>
                                    <div style={{ width: 150 }}>
                                        <b>Hành trình :</b>
                                    </div>
                                    <div>{tourDetail?.lichTrinh ? tourDetail.lichTrinh : ""}</div>
                                </div>
                                <div style={{ display: "flex" }}>
                                    <div style={{ width: 150 }}>
                                        <b>Ngày Đi :</b>
                                    </div>
                                    <div>  {Chitour.ngayDi === undefined ? "" : moment(Chitour.ngayDi, "YYYY-MM-DD").format("DD-MM-YYYY")}
                                    </div>
                                </div>
                                <div style={{ display: "flex" }}>
                                    <div style={{ width: 150 }}>
                                        <b>Ngày về :</b>
                                    </div>
                                    <div>  {Chitour.ngayVe === undefined ? "" : moment(Chitour.ngayVe, "YYYY-MM-DD").format("DD-MM-YYYY")}
                                    </div>
                                </div>
                            </div>

                            <div style={{ marginTop: 20 }}>
                                <b>{tourDetail?.tenTour ? tourDetail.tenTour + ". " : ""}</b>
                                {Chitour?.ghiChu ? Chitour.ghiChu : ""}
                            </div>

                        </div>
                    </div>
                </div>
                <div className="col-lg-4 blog-right-view">
                    <aside>
                        <div className="p-sticky-blog">
                            <div className="side-gridhny mb-lg-5 mb-4">
                                <div className="hny-cont-grid">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th colSpan={2}><span style={detailBoxStyle}>{tourDetail.tenTour}</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><b>Mã tour</b></td>
                                                <td>{tourDetail.id}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Thời gian:</b></td>
                                                <td>{tourDetail.soNgay} ngày {tourDetail.soDem} đêm</td>
                                            </tr>
                                            <tr>
                                                <td><b>Khởi hành:</b></td>
                                                <td>
                                                    {Chitour.ngayDi === undefined ? "" : moment(Chitour.ngayDi, "YYYY-MM-DD").format("DD-MM-YYYY")}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Vận Chuyển:</b></td>
                                                <td>{tourDetail.phuongTien}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Xuất phát: </b></td>
                                                <td>{tourDetail.xuatPhat} </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div className="side-gridhny mb-lg-5 mb-4">
                                <h4 className="side-title">Giá Người Lớn: {parseFloat(tourDetail.giaNguoiLon).toLocaleString("vi-VN", { style: "currency", currency: "VND" })}</h4>
                                <h4 className="side-title">Giá Trẻ Em: {parseFloat(tourDetail.giaTreEm).toLocaleString("vi-VN", { style: "currency", currency: "VND" })}</h4>
                                <h4 className="side-title">Giá Trẻ Nhỏ: {parseFloat(tourDetail.giaTreNho).toLocaleString("vi-VN", { style: "currency", currency: "VND" })}</h4>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </Modal>
    )
}

export default ChiTietDialog