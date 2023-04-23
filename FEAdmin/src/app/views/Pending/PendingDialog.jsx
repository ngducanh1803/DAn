import React, { useEffect } from "react";
import styled from 'styled-components';
import { Button, Form, Input, Modal, Row, Col, message } from 'antd';
import moment from "moment";
import { addPhieuDat, editPhieu } from "./PendingService.js"
import { toast } from "react-toastify";

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 3,
    closeOnClick: true
});

function PendingDialog(props) {

    const { open, onCancel, item } = props
    const [form] = Form.useForm()

    const submitForm = async (values) => {
        values = {
            ...values,
            soLuongDat: 1
        }
        if (item) {
            const res = await editPhieu(item.id, values)
            if (res.status === 200) {
                toast.success("Sua thanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        } else {
            const res = await addPhieuDat(values)
            if (res.status === 200) {
                toast.success("Them hanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        }
        form.resetFields()
        onCancel()
    }

    useEffect(() => {
        if (item) {
            form.setFieldsValue(item)
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
                            name="ten"
                            label="Ten"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                // {
                                //     min: 10,
                                //     message: "Ten tour phai it nhat 10 ky tu"
                                // },
                                {
                                    pattern: /^[a-zA-Z0-9\s-]+$/,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="cmnd"
                            label="CMND"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                // {
                                //     min: 2,
                                //     message: "Ten tour phai it nhat 2 ky tu"
                                // },
                                {
                                    pattern: /^\d{12}$/,
                                    message: "Không được có ký tự đặc biệt va chu"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={12}>
                        <Form.Item
                            name="diaChi"
                            label="Dia chi"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 5,
                                    message: "Ten tour phai it nhat 5 ky tu"
                                },
                                {
                                    pattern: /^[a-zA-Z0-9\s-]+$/,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={6}>
                        <Form.Item
                            name="sdt"
                            label="So dien thoai"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^(\+84|0)\d{9,10}$/,
                                    message: "Chua dung dinh dang dien thoai"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="email"
                            label="Email"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                // {
                                //     min: 3,
                                //     message: "Ten tour phai it nhat 5 ky tu"
                                // },
                                // {
                                //     pattern: /^[a-zA-Z0-9\s-]+$/,
                                //     message: "Không được có ký tự đặc biệt"
                                // }
                            ]}
                        >
                            <Input type="email" />
                        </Form.Item>
                    </Col>

                    <Col span={12}>
                        <Form.Item
                            name="ghiChu"
                            label="Ghi chú"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                // {
                                //     pattern: /^[1-9]\d*$/,
                                //     message: "So ngay > 0"
                                // }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                </Row>

                <Row gutter={[16, 16]}>

                    <Col span={6}>
                        <Form.Item
                            name="treEm"
                            label="Tre em"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[0-9]\d*$/,
                                    message: "So tre e >= 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="treNho"
                            label="So tre nho"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[0-9]\d*$/,
                                    message: "So tre nho >= 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="nguoiLon"
                            label="So nguoi lon"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "So nguoi lon > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="idChitiettour"
                            label="Id chi tiet"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
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

export default PendingDialog

/**
 * {
    "ten":"duc anh 1",
    "cmnd":"20192732",
    "diaChi": "bac ninh",
    "sdt" : "0971533818",
    "email":"ducanh@gmail.com",
    "ghiChu":"nay anynay",
    "treEm": 3,
    "treNho":3,
    "nguoiLon":4,
    "soLuongDat": 1,
    "idChitiettour":2
}
 *
 */

// const StyledModal = styled(Modal)`
//     .ant-modal-content{
//         overflow: hidden;
//         height: 90vh;
//     }
//     .ant-modal-body{
//         min-height: 76vh;
//         overflow: hidden;
//     }

//     .ant-modal-footer{
//         position: absolute;
//         bottom: 0;

//     }
// `;
