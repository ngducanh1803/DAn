import React, { useEffect, useState } from "react";
import { Modal, Button, Tabs, Row, Col, Table, Image, Form, Input, Upload } from "antd"

import styled from 'styled-components';
import moment from "moment";
import { addTourChiTiet, updateTourChiTiet } from "./StaffAcceptedService";
import { toast } from "react-toastify";

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 3,
    closeOnClick: true
});

const beforeUpload = (file) => {
    const isJpgOrPng = file.type === "image/jpeg" || file.type === "image/png" || file.type === "image/jpg";
    if (!isJpgOrPng) {
        alert("You can only upload JPG/PNG file!");
    }
    return isJpgOrPng;
}

function StaffAcceptedDialog(props) {

    const { open, onCancel, item } = props
    const [form] = Form.useForm()
    const [timeItem, setTimeItem] = useState()

    const [fileImage, setFileImage] = useState()
    const handleUpload = (event) => {
        console.log('Tên tệp tin:', event.file.name);
        setFileImage(event.file.name)
    }

    const submitForm = async (values) => {

        const newValue = {
            ...values,
            hinhAnh: fileImage
        }


        if (item) {
            const res = await updateTourChiTiet(item.idChiTiet, newValue)
            if (res.status === 200) {
                toast.success("Sửa Thành công")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        } else {
            const res = await addTourChiTiet(newValue)
            if (res.status === 200) {
                toast.success("Thêm thành công")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        }
        form.resetFields()
        onCancel()
    }

    useEffect(() => {
        console.log("==>", item)
        if (item) {
            const newItem = {
                ...item,
                ngayDi: moment(item.ngayDi, "YYYY-MM-DD").format("YYYY-MM-DD"),
                ngayVe: moment(item.ngayVe, "YYYY-MM-DD").format("YYYY-MM-DD")
            }
            if (newItem) {
                form.setFieldsValue(newItem)
            }
        }
    }, [])



    return (
        <Modal
            title="Them Tour"
            open={open}
            width={1000}
            style={{ height: 700 }}
            // onOk={handleOk} 
            onCancel={onCancel}
            footer={null}
        >
            <Form
                form={form}
                onFinish={submitForm}
                layout="vertical"
            >
                <Row gutter={[16, 16]}>
                    <Col span={6}>
                        <Form.Item
                            name="idTour"
                            label="Id"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "ID > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="ngayDi"
                            label="Ngay di"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input type="date" style={{ lineHeight: "21px" }} />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="ngayVe"
                            label="Ngay ve"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input type="date" style={{ lineHeight: "21px" }} />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="soLuongCon"
                            label="So luong con"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[0-9]\d*$/,
                                    message: "So luong >= 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={12}>
                        <Form.Item
                            name="ghiChu"
                            label="Ghi chu"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                </Row>

                <Row>
                    <Col span={8} className="image-info">
                        <Row>
                            <div className="avatar" >
                                <Image
                                    // src={fileImage ? fileImage?.toString() : "error"}
                                    src={fileImage && `http://127.0.0.1:8887/${fileImage}`}
                                    fallback="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMIAAADDCAYAAADQvc6UAAABRWlDQ1BJQ0MgUHJvZmlsZQAAKJFjYGASSSwoyGFhYGDIzSspCnJ3UoiIjFJgf8LAwSDCIMogwMCcmFxc4BgQ4ANUwgCjUcG3awyMIPqyLsis7PPOq3QdDFcvjV3jOD1boQVTPQrgSkktTgbSf4A4LbmgqISBgTEFyFYuLykAsTuAbJEioKOA7DkgdjqEvQHEToKwj4DVhAQ5A9k3gGyB5IxEoBmML4BsnSQk8XQkNtReEOBxcfXxUQg1Mjc0dyHgXNJBSWpFCYh2zi+oLMpMzyhRcASGUqqCZ16yno6CkYGRAQMDKMwhqj/fAIcloxgHQqxAjIHBEugw5sUIsSQpBobtQPdLciLEVJYzMPBHMDBsayhILEqEO4DxG0txmrERhM29nYGBddr//5/DGRjYNRkY/l7////39v///y4Dmn+LgeHANwDrkl1AuO+pmgAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAwqADAAQAAAABAAAAwwAAAAD9b/HnAAAHlklEQVR4Ae3dP3PTWBSGcbGzM6GCKqlIBRV0dHRJFarQ0eUT8LH4BnRU0NHR0UEFVdIlFRV7TzRksomPY8uykTk/zewQfKw/9znv4yvJynLv4uLiV2dBoDiBf4qP3/ARuCRABEFAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghgg0Aj8i0JO4OzsrPv69Wv+hi2qPHr0qNvf39+iI97soRIh4f3z58/u7du3SXX7Xt7Z2enevHmzfQe+oSN2apSAPj09TSrb+XKI/f379+08+A0cNRE2ANkupk+ACNPvkSPcAAEibACyXUyfABGm3yNHuAECRNgAZLuYPgEirKlHu7u7XdyytGwHAd8jjNyng4OD7vnz51dbPT8/7z58+NB9+/bt6jU/TI+AGWHEnrx48eJ/EsSmHzx40L18+fLyzxF3ZVMjEyDCiEDjMYZZS5wiPXnyZFbJaxMhQIQRGzHvWR7XCyOCXsOmiDAi1HmPMMQjDpbpEiDCiL358eNHurW/5SnWdIBbXiDCiA38/Pnzrce2YyZ4//59F3ePLNMl4PbpiL2J0L979+7yDtHDhw8vtzzvdGnEXdvUigSIsCLAWavHp/+qM0BcXMd/q25n1vF57TYBp0a3mUzilePj4+7k5KSLb6gt6ydAhPUzXnoPR0dHl79WGTNCfBnn1uvSCJdegQhLI1vvCk+fPu2ePXt2tZOYEV6/fn31dz+shwAR1sP1cqvLntbEN9MxA9xcYjsxS1jWR4AIa2Ibzx0tc44fYX/16lV6NDFLXH+YL32jwiACRBiEbf5KcXoTIsQSpzXx4N28Ja4BQoK7rgXiydbHjx/P25TaQAJEGAguWy0+2Q8PD6/Ki4R8EVl+bzBOnZY95fq9rj9zAkTI2SxdidBHqG9+skdw43borCXO/ZcJdraPWdv22uIEiLA4q7nvvCug8WTqzQveOH26fodo7g6uFe/a17W3+nFBAkRYENRdb1vkkz1CH9cPsVy/jrhr27PqMYvENYNlHAIesRiBYwRy0V+8iXP8+/fvX11Mr7L7ECueb/r48eMqm7FuI2BGWDEG8cm+7G3NEOfmdcTQw4h9/55lhm7DekRYKQPZF2ArbXTAyu4kDYB2YxUzwg0gi/41ztHnfQG26HbGel/crVrm7tNY+/1btkOEAZ2M05r4FB7r9GbAIdxaZYrHdOsgJ/wCEQY0J74TmOKnbxxT9n3FgGGWWsVdowHtjt9Nnvf7yQM2aZU/TIAIAxrw6dOnAWtZZcoEnBpNuTuObWMEiLAx1HY0ZQJEmHJ3HNvGCBBhY6jtaMoEiJB0Z29vL6ls58vxPcO8/zfrdo5qvKO+d3Fx8Wu8zf1dW4p/cPzLly/dtv9Ts/EbcvGAHhHyfBIhZ6NSiIBTo0LNNtScABFyNiqFCBChULMNNSdAhJyNSiECRCjUbEPNCRAhZ6NSiAARCjXbUHMCRMjZqBQiQIRCzTbUnAARcjYqhQgQoVCzDTUnQIScjUohAkQo1GxDzQkQIWejUogAEQo121BzAkTI2agUIkCEQs021JwAEXI2KoUIEKFQsw01J0CEnI1KIQJEKNRsQ80JECFno1KIABEKNdtQcwJEyNmoFCJAhELNNtScABFyNiqFCBChULMNNSdAhJyNSiECRCjUbEPNCRAhZ6NSiAARCjXbUHMCRMjZqBQiQIRCzTbUnAARcjYqhQgQoVCzDTUnQIScjUohAkQo1GxDzQkQIWejUogAEQo121BzAkTI2agUIkCEQs021JwAEXI2KoUIEKFQsw01J0CEnI1KIQJEKNRsQ80JECFno1KIABEKNdtQcwJEyNmoFCJAhELNNtScABFyNiqFCBChULMNNSdAhJyNSiECRCjUbEPNCRAhZ6NSiAARCjXbUHMCRMjZqBQiQIRCzTbUnAARcjYqhQgQoVCzDTUnQIScjUohAkQo1GxDzQkQIWejUogAEQo121BzAkTI2agUIkCEQs021JwAEXI2KoUIEKFQsw01J0CEnI1KIQJEKNRsQ80JECFno1KIABEKNdtQcwJEyNmoFCJAhELNNtScABFyNiqFCBChULMNNSdAhJyNSiEC/wGgKKC4YMA4TAAAAABJRU5ErkJggg=="
                                />
                                {/* <img src={data?.anhMot && `http://127.0.0.1:8887/${data.anhMot}`} alt="ing" /> */}
                            </div>
                        </Row>
                        <Row >
                            <Form.Item name="hinhAnh">
                                <Upload
                                    name="hinhAnh"
                                    action="https://www.mocky.io/v2/5cc8019d300000980a055e76"
                                    onChange={handleUpload}
                                    beforeUpload={beforeUpload}
                                    showUploadList={false}
                                >
                                    <Button >
                                        Thêm ảnh đại diện
                                    </Button>
                                </Upload>
                            </Form.Item>
                        </Row>
                    </Col>
                </Row>

                <Row justify={"center"}>
                    <Form.Item>
                        <Button type="primary" htmlType="submit">
                            Submit
                        </Button>
                    </Form.Item>
                </Row>
            </Form>
        </Modal>
    )
}

export default StaffAcceptedDialog

/**
 *  {      
        "idTour" : 1
        "ngayDi": "2023-06-06",
        "ngayVe": "2019-06-10",
        "soLuongCon": 23,
        "ghiChu": "dsddsdsdsd",
        "hinhAnh": "YbhTzyNe2EuyMf3uPtC3JGdyR48ApRNX9l9hH5Qk.jpeg",
 }
 */

const StyledModal = styled(Modal)`
    .ant-modal-content{
        overflow: hidden;
        height: 90vh;
    }
    .ant-modal-body{
        min-height: 76vh;
        overflow: hidden;
    }

    .ant-modal-footer{
        position: absolute;
        bottom: 0;

    }

    input[type="date"] {
        line-height: 21px;
    }
`;